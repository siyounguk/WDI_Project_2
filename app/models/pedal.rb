class Pedal < ActiveRecord::Base
  acts_as_votable
  has_and_belongs_to_many :rigs
  has_and_belongs_to_many :users
end
