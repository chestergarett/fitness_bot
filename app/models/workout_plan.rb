class WorkoutPlan < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :startDate, presence: true
  validates :status, presence: true
end
