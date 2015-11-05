class CreateRigs < ActiveRecord::Migration
  def change
    create_table :rigs do |t|
      t.string :guitarist
      t.text :rig_photo
      t.text :description
      t.text :comments
      t.integer :user_id
      t.integer :pedal_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
