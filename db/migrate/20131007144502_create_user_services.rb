class CreateUserServices < ActiveRecord::Migration
  def change
    create_table :user_services do |t|
      t.references :user, index: true
      t.references :service, index: true

      t.timestamps
    end
  end
end
