class ClientProfile < ApplicationRecord
  belongs_to :user

  validates :height, presence: true
  validates :current_weight, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :workout_frequency, presence: true
  validates :body_type, presence: true
end
