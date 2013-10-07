class AddTimeZoneToPlace < ActiveRecord::Migration
  def change
    add_column :places, :time_zone, :string, default: "UTC"
  end
end
