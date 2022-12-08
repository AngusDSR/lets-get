class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show]
  before_action :set_meet, only: %i[show index]

  def index
    if params[:query].present?
      @businesses = Business.where(category: params[:query]).where(current_search: true)
    else
      @businesses = Business.all.where(current_search: true)
    end
  end

  def show
    @business = Business.find(params[:id])
    description = get_business_description(@business.place_id).first[1]["overview"]
    unless description.nil? || description == "{}"
       @business.update(description: description)
    end
    # raise
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      redirect_to businesses_path(user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @business = Business.new
  end

  private

  def set_meet
    @meet = Meet.find(params[:meet_id])
  end

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :description, :category, :street_address, :image_url)
  end

  def get_business_description(place_id)
    url = URI("https://maps.googleapis.com/maps/api/place/details/json?key=#{ENV.fetch('GOOGLE_MAPS_API')}&place_id=#{place_id}&fields=editorial_summary")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    response.read_body
    JSON.parse(response.read_body)["result"]
  end
end
