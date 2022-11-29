class Meet < ApplicationRecord
  RADIUS = 250
  belongs_to :user
  belongs_to :business, optional: true
  # add validations
end
