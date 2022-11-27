class Business < ApplicationRecord
  TYPES = %w[bar cafe park casino gym spa restaurant museum night_club movie_theater bowling_alley amusement_park art_gallery]
  geocoded_by :street_address
  after_validation :geocode, if: :will_save_change_to_street_address?
  has_many :meets
  # add validations
end
