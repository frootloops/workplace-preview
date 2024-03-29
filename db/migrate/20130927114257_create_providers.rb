class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.references :user, index: true
      t.string :name
      t.string :uid

      t.timestamps
    end
  end
end
