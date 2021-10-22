class UserWorkout < ApplicationRecord
  belongs_to :user
  validates :name, :start_date, presence: true
end
