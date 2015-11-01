class Rig < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :pedals
  belongs_to :genre
  has_many :favourites
end
