class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :section_cd
      t.text :body
      t.datetime :scheduled_at
      t.string :poster

      t.timestamps
    end
    add_index :events, :section_cd
  end
end
