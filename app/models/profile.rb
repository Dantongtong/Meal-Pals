class Profile < ActiveRecord::Base
  belongs_to :user

  validates :phone,:numericality => true, :allow_nil => true

  mount_uploader :avatar, ImageUploader

end
