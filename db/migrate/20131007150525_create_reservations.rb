class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :workstation, index: true
      t.string :state
      t.integer :master_id
      t.text :comment

      t.timestamps
    end
    add_index :reservations, :master_id
  end
end
