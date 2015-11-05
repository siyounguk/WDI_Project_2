class ChangeColumnNamesPedals < ActiveRecord::Migration
  def change
    rename_column :pedals, :name, :title
    rename_column :pedals, :price_paid, :price
    rename_column :pedals, :pedal_photo, :image_url
    rename_column :pedals, :review, :short_description
    

  end
end
