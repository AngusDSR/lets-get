class AddDurationAddModesToMeets < ActiveRecord::Migration[7.0]
  def change
    add_column :meets, :modes, :text, array: true
    add_column :meets, :duration, :string
  end
end
