# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##test users
user = User.create(username: 'test_username', email: 'test@email.com', password: 'password')

#test diet plans
diet_plan = DietPlan.create(title: 'test diet', description: 'test description', end_date: Time.now)
food_option = FoodOption.create(diet_plan_id: 1, meal_type: 'dinner', dish_type: 'Main course', diet_type: 'balanced', health_label: 'celery-free', cuisine_type: 'American', main_ingredient: 'Chicken', no_of_ingredients: 8, calories: 400, excluded: 'Oyster')
food_option.diet_plan = diet_plan
food_option.save
