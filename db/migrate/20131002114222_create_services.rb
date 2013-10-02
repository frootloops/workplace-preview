class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :profile_cd
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :services, :profile_cd
  end
end
