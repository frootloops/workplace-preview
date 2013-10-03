class CreateWorkstations < ActiveRecord::Migration
  def change
    create_table :workstations do |t|
      t.references :place, index: true
      t.references :service, index: true
      t.string :name

      t.timestamps
    end
  end
end
