class FoodOption < ApplicationRecord
  belongs_to :diet_plan
  
  validates :main_ingredient, presence: true
end
