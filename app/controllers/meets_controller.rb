require "uri"
require "net/http"

class MeetsController < ApplicationController
  before_action :set_meet, only: %i[show update create_directions]
  before_action :set_business, only: %i[update]

  def index
    @meets = Meet.all
  end

  def show
    return (redirect_to meet_businesses_path(@meet)) if @meet.business.nil?
    @user_start = "#{@meet.start_point_lat}, #{@meet.start_point_long}"
    @friend_start = "#{@meet.friend_lat}, #{@meet.friend_long}"
    @meetup = "#{@meet.midpoint_lat}, #{@meet.midpoint_long}"
    if @meet.directions.nil?
      @route = get_navigation_steps(@user_start, @meet.business.street_address)
      @meet.directions = text_to_array(create_directions(@route))
      @meet.duration = @route.duration.text
      @meet.modes = text_to_array(get_icons(@route))
      @meet.friend_directions = create_directions(get_navigation_steps(@friend_start, @meet.business.street_address))
      @meet.save
    end

    @directions_parsed = text_to_array(@meet.directions)
    @name = "Directions to #{@meet.business.name}"
    @whatsapp_directions = "#{@name}%0a#{@meet.friend_directions.join('%0a ▬ ')}"
    Business.update_all(current_search: false)
  end

  def new
    Business.update_all(current_search: false)
    @meet = Meet.new
  end

  def create
    @meet = Meet.new(meet_params)
    @meet.user = current_user
    if @meet.save
      midpoint = indentify_midpoint(
        "#{@meet.start_point_lat}, #{@meet.start_point_long}",
        "#{@meet.friend_lat}, #{@meet.friend_long}"
      )
      @meet.midpoint_lat = midpoint.first
      @meet.midpoint_long = midpoint.last
      @meet.save
      @businesses = find_business_nearby(
        @meet.midpoint_lat,
        @meet.midpoint_long
      )
      save_business_results(@businesses)
      redirect_to meet_businesses_path(@meet)
    else
      render :new, status: :unprocessable_entity
      # Should be an alert rather than simple form info
    end
  end

  def update
    @meet.business = @business
    @meet.name.gsub!(/(?<=▬).*(?=▬)/, " #{@business.name} ").gsub!(/[0-9]+\s/, '')
    @meet.save
    # REFACTOR
    redirect_to meet_path(@meet)
  end

  private

  def set_meet
    @meet = Meet.find(params[:id])
  end

  def set_business
    @business = Business.find(meet_params[:business_id])
  end

  def meet_params
    # most of these will be generated by a hidden form
    params.require(:meet).permit(
      :name, :start_point_long, :start_point_lat,
      :friend_long, :friend_lat, :business_id
    )
  end

  def find_business_nearby(mid_lat, mid_long)
    coords = [mid_lat, mid_long].join("%2C")
    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{coords}&radius=#{Meet::RADIUS}&type=#{Business::TYPES.join('|')}&key=#{ENV.fetch('GOOGLE_MAPS_API')}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    response.read_body
    JSON.parse(response.read_body)["results"]
  end

  def indentify_midpoint(user_location, friend_location)
    route_steps = Google::Maps.route(user_location, friend_location).steps
    route_steps.select! { |step| step.travel_mode == "TRANSIT" }
    if route_steps.size == 1
      midpoint = route_steps.first
    else
      midpoint = route_steps[(route_steps.size / 2) - 1]
    end
    [
      midpoint["end_location"]["lat"],
      midpoint["end_location"]["lng"]
    ]
  end

  def save_business_results(results)
    results.each do |bus|
      # TESTING
      if Business.find_by(place_id: bus["place_id"]).nil? && Business.find_by(name: bus["name"]).nil?
      # TESTING
        if bus["rating"].to_f >= 4.0
          @photos = bus["photos"][0]["photo_reference"] unless bus["photos"].nil?
          Business.create(
            name: bus["name"],
            description: "#{bus['name']} is a #{Faker::Adjective.positive} #{bus['types'][0]} in #{bus['vicinity'].gsub(/[^,]*$/).first.strip}.",
            category: bus["types"][0],
            street_address: bus["vicinity"],
            image_url: @photos,
            rating: bus["rating"],
            latitude: bus["geometry"]["location"]["lat"],
            longitude: bus["geometry"]["location"]["lng"],
            place_id: bus["place_id"]
          )
        end
      else
        Business.update(place_id: bus["place_id"], current_search: true)
      end
    end
  end

  def get_navigation_steps(start_point, meet_point)
    Google::Maps.route(start_point, meet_point)
  end

  def create_directions(route)
    directions = []
    route.steps.each do |step|
      # directions << step.travel_mode # to be used for icons
      if step.travel_mode == "TRANSIT"
        stops = step.transit_details.num_stops
        directions << "Take the #{step.transit_details.line.short_name} to #{step.transit_details.arrival_stop.name} (#{stops} #{"stop".pluralize(stops)})"
      else
        directions << step.html_instructions
      end
    end
    directions
  end

  def get_icons(route)
    modes = []
    route.steps.each do |step|
      modes << step.transit_details.line.vehicle.name unless step.transit_details.nil?
    end
    modes
  end

  def text_to_array(text)
    text.to_s.gsub('[', '').gsub(']','').split('"').reject { |item| item == ", " || item == "" }
  end
end
