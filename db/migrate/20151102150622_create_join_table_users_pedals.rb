class CreateJoinTableUsersPedals < ActiveRecord::Migration
  def change
    create_join_table :users, :pedals do |t|

    end
  end
end
