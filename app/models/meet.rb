class Meet < ApplicationRecord
  RADIUS = 100
  belongs_to :user
  has_one :business
  # add validations
end
