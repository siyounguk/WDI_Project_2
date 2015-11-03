class Pedal < ActiveRecord::Base
  acts_as_votable

  
  include PgSearch

  pg_search_scope :search_by_title, :against => :title

  has_and_belongs_to_many :rigs
  has_and_belongs_to_many :users
end
