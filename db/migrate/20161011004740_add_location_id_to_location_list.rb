class AddLocationIdToLocationList < ActiveRecord::Migration[5.0]
  def change
    add_column :location_lists, :location_id, :integer
  end
end
