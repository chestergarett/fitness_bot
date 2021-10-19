FactoryBot.define do
  factory :client_profile do
    height { 180 }
    current_weight { 75 }
    sex { 'M' }
    age { 26 }
    workout_frequency { 'SELDOM' }
    body_type { 'LEAN FAT' }
  end
end
