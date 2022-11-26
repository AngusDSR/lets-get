class Meet < ApplicationRecord
  RADIUS = 250
  belongs_to :user
  # add validations
end
