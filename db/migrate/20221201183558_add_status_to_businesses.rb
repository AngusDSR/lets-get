class AddStatusToBusinesses < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :current_search, :boolean, default: true
  end
end
