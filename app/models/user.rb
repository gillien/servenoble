class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :password, presence: true
  validates :email, presence: true, uniqueness: true, format: Devise::email_regexp
end
