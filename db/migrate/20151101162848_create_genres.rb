class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :genre_name
      t.integer :rig_id

      t.timestamps null: false
    end
  end
end
