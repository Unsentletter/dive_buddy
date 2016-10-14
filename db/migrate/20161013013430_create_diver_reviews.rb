class CreateDiverReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :diver_reviews do |t|
      t.references :profile, foreign_key: true
      t.text :diver_review
      t.integer :diver_rating

      t.timestamps
    end
  end
end
