class Rig < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_guitarist, :against => :guitarist
  mount_uploader :guitarist_upload_image, GuitaristImageUploader
  mount_uploader :rig_upload_image, RigImageUploader
  acts_as_votable
  acts_as_commentable
  belongs_to :user
  has_and_belongs_to_many :pedals
  belongs_to :genre
  has_many :favourites
end
