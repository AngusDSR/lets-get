class AddRatingToBusinesses < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :rating, :float, default: 0
  end
end
