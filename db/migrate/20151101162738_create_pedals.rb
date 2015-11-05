class CreatePedals < ActiveRecord::Migration
  def change
    create_table :pedals do |t|
      t.string :name
      t.string :type
      t.text :pedal_photo
      t.integer :price_paid
      t.text :review
      t.integer :rig_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
