class DietPlan < ApplicationRecord
  belongs_to :user
  has_many :food_options, dependent: :destroy
  has_many :foods, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :end_date, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 200 }
end
