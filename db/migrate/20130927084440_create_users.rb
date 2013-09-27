class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :name
      t.integer :gender_cd
      t.string :phone

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :gender_cd
  end
end
