class AddFriendDirectionsToMeets < ActiveRecord::Migration[7.0]
  def change
    add_column :meets, :friend_directions, :text, array: true
  end
end
