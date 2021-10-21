class Food < ApplicationRecord
  validates :name, :ingredients, :media, presence: true
end