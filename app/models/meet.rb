class Meet < ApplicationRecord
  RADIUS = 250
  belongs_to :user
  has_one :business
  # add validations
end
