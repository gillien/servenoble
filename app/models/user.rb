##
# User of the application
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :password, presence: true
  validates :email, presence: true, uniqueness: true, format: Devise.email_regexp

  before_validation :generate_password, on: :create

  private #############

  def generate_password
    self.password ||= Devise.friendly_token.first(8)
  end
end
