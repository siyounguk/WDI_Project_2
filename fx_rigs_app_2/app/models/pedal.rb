class Pedal < ActiveRecord::Base
  has_and_belongs_to_many :rigs
  has_and_belongs_to_many :users
end
