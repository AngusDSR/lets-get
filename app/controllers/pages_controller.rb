require "uri"
require "net/http"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # We need to create a button for this
    category = ["park", "cafe", "bar", "restaurant"].sample
    radius = "250"
    coords = [-33.8670522, 151.1957362].join("%2C")
    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{coords}&radius=#{radius}&type=#{category}&key=#{ENV.fetch('GOOGLE_MAPS_API')}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    response.read_body
    @places = JSON.parse(response.read_body)["results"]
  end
end
