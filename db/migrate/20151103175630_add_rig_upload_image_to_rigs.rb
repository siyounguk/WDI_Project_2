class AddRigUploadImageToRigs < ActiveRecord::Migration
  def change
    add_column :rigs, :rig_upload_image, :string
  end
end
