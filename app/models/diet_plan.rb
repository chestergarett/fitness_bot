class DietPlan < ApplicationRecord
  # belongs_to :user
  has_many :food_option, dependent: :destroy

  validates :title, :description, :end_date, presence: true
  validates :description, length: { minimum: 5, maximum: 200 }
end
