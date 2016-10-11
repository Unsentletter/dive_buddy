class AddTimeWindowToLocationList < ActiveRecord::Migration[5.0]
  def change
    add_column :location_lists, :time_window, :datetime
  end
end
