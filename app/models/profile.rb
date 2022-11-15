class Profile < ActiveRecord::Base
  belongs_to :user

  validates :phone, :allow_blank => true, :numericality => true

  mount_uploader :avatar, ImageUploader

end
