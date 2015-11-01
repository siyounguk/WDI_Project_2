class AddGuitaristPhotosToRigs < ActiveRecord::Migration
  def change
    add_column :rigs, :guitarist_photo, :text
  end
end
