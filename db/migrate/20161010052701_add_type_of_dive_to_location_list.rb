class AddTypeOfDiveToLocationList < ActiveRecord::Migration[5.0]
  def change
    add_column :location_lists, :type_of_dive, :string
  end
end
