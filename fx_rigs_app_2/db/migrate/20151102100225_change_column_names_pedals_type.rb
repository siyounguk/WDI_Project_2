class ChangeColumnNamesPedalsType < ActiveRecord::Migration
  def change
    rename_column :pedals, :type, :pedal_type
  end
end
