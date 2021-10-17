class FoodOption < ApplicationRecord
  # belongs_to :diet_plan
  # has_many :food
  validates :main_ingredient, presence: true
end
