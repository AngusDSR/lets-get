class CreateMeets < ActiveRecord::Migration[7.0]
  def change
    create_table :meets do |t|
      t.string :name
      t.float :start_point_lat
      t.float :start_point_long
      t.float :friend_lat
      t.float :friend_long
      t.float :midpoint_lat
      t.float :midpoint_long
      t.text :directions
      t.integer :radius, default: 100
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true
      t.references :businesses, foreign_key: true
      t.timestamps
    end
  end
end
