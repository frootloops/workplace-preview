class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :title
      t.text :body
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
