require "uri"
require "net/http"

class MeetsController < ApplicationController
  before_action :set_meet, only: %i[show]

  # needs a joining table between businesses and meets?
  # one meet could include a 10 nearby business but so could another

  def index
    # this page will be a simple list - maybe with a photo
    # should only be current user's
    # low priority

    # current_user.meets
    @meets = Meet.all
  end

  def show
  end

  def new
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
      # pre-select the meet on the index
      redirect_to meet_businesses_path(@meet)
    else
      render :new, status: :unprocessable_entity
      # as a pop up rather than simple form info
    end
  end

  private

  def set_meet
    @meet = Meet.find(params[:id])
  end

  def meet_params
    # most of these will be generated by a hidden form
    params.require(:meet).permit(
      :name, :start_point_long, :start_point_lat,
      :friend_long, :friend_lat
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
    # Generate route
    route_steps = Google::Maps.route(user_location, friend_location).steps
    # How many steps?
    midpoint = route_steps[route_steps.size / 2]
    [
      midpoint["end_location"]["lat"],
      midpoint["end_location"]["lng"]
    ]
  end
  raise
  def save_business_results(results)
    results.each do |bus|
      next unless Business.find_by(place_id: bus["place_id"]).nil?

      Business.create(
        name: bus["name"],
        description: "#{bus['name']} is a #{Faker::Adjective.positive} #{bus['types'][0]} in #{bus['vicinity'].gsub(/[^,]*$/).first.strip}",
        category: bus["types"][0],
        street_address: bus["vicinity"],
        image_url: bus["photos"][0]["photo_reference"],
        latitude: bus["geometry"]["location"]["lat"],
        longitude: bus["geometry"]["location"]["lnng"],
        place_id: bus["place_id"]
      )
    end
  end
end
