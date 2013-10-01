class ChangeStatusCdFromPlaces < ActiveRecord::Migration
  def change
    change_column :places, :status_cd, :integer, default: 0
  end
end
