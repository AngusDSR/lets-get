class Business < ApplicationRecord
  MAX_DIMS = 100
  TYPES = %w[bar cafe park casino gym spa restaurant museum night_club movie_theater bowling_alley amusement_park art_gallery]
  PHOTO_ROUTE = "https://maps.googleapis.com/maps/api/place/photo?photoreference="
  PHOTO_PARAMS = "&sensor=false&maxheight=#{MAX_DIMS}&maxwidth=#{MAX_DIMS}&key=#{ENV.fetch('GOOGLE_MAPS_API')}"
  geocoded_by :street_address
  after_validation :geocode, if: :will_save_change_to_street_address?
  has_many :meets
  # add validations
end
