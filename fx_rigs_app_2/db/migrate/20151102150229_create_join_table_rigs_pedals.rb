class CreateJoinTableRigsPedals < ActiveRecord::Migration
  def change
    create_join_table :rigs, :pedals do |t|

    end
  end
end
