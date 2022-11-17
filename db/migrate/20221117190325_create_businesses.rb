class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :street_address
      t.string :image_url

      t.timestamps
    end
  end
end
