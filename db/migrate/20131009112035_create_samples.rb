class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.references :master, index: true
      t.references :service, index: true
      t.string :file

      t.timestamps
    end
  end
end
