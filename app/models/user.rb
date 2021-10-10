class User < ApplicationRecord
  acts_as_token_authenticatable

  validates :email, presence: true, uniqueness: true
  has_one :access_token, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
