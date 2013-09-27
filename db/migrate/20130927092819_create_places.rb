class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.references :city, index: true
      t.string :address
      t.string :name
      t.integer :area
      t.string :opening_hours
      t.integer :status_cd

      t.timestamps
    end
    add_index :places, :status_cd
  end
end
