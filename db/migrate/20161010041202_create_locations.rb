class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :description
      t.string :depth
      t.string :difficulty
      t.float :latitude
      t.float :longitude
      t.references :location_lists, foreign_key: true

      t.timestamps
    end
  end
end
