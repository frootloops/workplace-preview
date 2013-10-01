class AddOwnerIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :owner_id, :integer
    add_index :places, :owner_id
  end
end
