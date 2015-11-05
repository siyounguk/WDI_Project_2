class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :pedal_id

      t.timestamps null: false
    end
  end
end
