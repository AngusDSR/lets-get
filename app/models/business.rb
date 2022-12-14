class Business < ApplicationRecord
  TYPES = %w[bar cafe park casino gym spa restaurant museum night_club movie_theater bowling_alley amusement_park art_gallery]
  PHOTO_ROUTE = "https://maps.googleapis.com/maps/api/place/photo?photoreference="
  INDEX_PARAMS = "&sensor=false&maxheight=100&maxwidth=100&key=#{ENV.fetch('GOOGLE_MAPS_API')}"
  SHOW_PARAMS = "&sensor=false&maxheight=300&maxwidth=300&key=#{ENV.fetch('GOOGLE_MAPS_API')}"
  BAR_PHOTOS = %w[prague.jpg bell.jpg travellerstavern.jpg blackfriar.jpg burdock.jpg found.jpg mercato.jpg]
  RESTAURANT_PHOTOS = %w[sketch.jpg samba.jpg dalloway.jpg amazonico.jpg bancone.jpg barbary.jpg flour.jpg padella.jpg cheeze.jpg]

  geocoded_by :street_address
  after_validation :geocode, if: :will_save_change_to_street_address?
  has_many :meets
  # add validations
end
