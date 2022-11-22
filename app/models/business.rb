class Business < ApplicationRecord
  geocoded_by :street_address
  after_validation :geocode, if: :will_save_change_to_street_address?
  has_many :meets
  # add validations
end
