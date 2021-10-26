class Food < ApplicationRecord
  belongs_to :diet_plan
  validates :name, :ingredients, :media, presence: true
end
