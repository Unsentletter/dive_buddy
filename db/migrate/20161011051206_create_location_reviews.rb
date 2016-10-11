class CreateLocationReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :location_reviews do |t|
      t.references :profile, foreign_key: true
      t.references :location, foreign_key: true
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
