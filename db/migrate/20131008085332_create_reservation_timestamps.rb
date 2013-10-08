class CreateReservationTimestamps < ActiveRecord::Migration
  def change
    create_table :reservation_timestamps do |t|
      t.references :reservation, index: true
      t.datetime :timestamp

      t.timestamps
    end
  end
end
