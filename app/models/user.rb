
REGEX_PATTERN = /\A[A-Za-z0-9+_.-]+@[A-Za-z0-9+_.-]*columbia.edu\z/i
class User < ActiveRecord::Base
  has_one :profile

  validates :email, presence: true , uniqueness: true,
            format: { with: REGEX_PATTERN, message: " address is invalid or not a columbia email."}
  validates :first_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }

  before_create :confirmation_token
  after_create :create_profile
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def create_profile
    Profile.create!(user_id: self.id)
  end
end
