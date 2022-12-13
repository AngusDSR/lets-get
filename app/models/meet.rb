class Meet < ApplicationRecord
  RADIUS = 300
  belongs_to :user
  belongs_to :business, optional: true

  # add validations
end
