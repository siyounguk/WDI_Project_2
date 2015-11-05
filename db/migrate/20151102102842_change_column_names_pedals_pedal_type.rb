class ChangeColumnNamesPedalsPedalType < ActiveRecord::Migration
  def change
    rename_column :pedals, :pedal_type, :category
  end
end
