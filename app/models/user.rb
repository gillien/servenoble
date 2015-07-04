class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  validates :email, presence: true, uniqueness: true, format: Devise::email_regexp
end
