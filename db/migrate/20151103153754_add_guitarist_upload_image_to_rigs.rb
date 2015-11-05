class AddGuitaristUploadImageToRigs < ActiveRecord::Migration
  def change
    add_column :rigs, :guitarist_upload_image, :string
  end
end
