class RemoveLocationFromBusinesses < ActiveRecord::Migration[7.0]
  def change
    remove_column :businesses, :location_coordinates, :string
  end
end
