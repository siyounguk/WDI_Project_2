class Rig < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_and_belongs_to_many :pedals
  belongs_to :genre
  has_many :favourites
end
