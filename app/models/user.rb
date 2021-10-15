class User < ApplicationRecord
  acts_as_token_authenticatable

  validates :email, presence: true, uniqueness: true
  has_one :access_token, dependent: :destroy
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
end
