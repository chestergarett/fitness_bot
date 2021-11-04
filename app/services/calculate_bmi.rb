class CalculateBmi < ApplicationService
  attr_reader :current_weight, :height

  def initialize(current_weight, height)
    @current_weight = current_weight
    @height = height
  end

  def calculate_bmi
    @compute_bmi = @current_weight / (@height * 0.01)**2
  end

  def call
    @compute_bmi = @current_weight / (@height * 0.01)**2
    meal_type = ["Breakfast", "Lunch", "Dinner"]

    if @compute_bmi < 16 || @compute_bmi > 40
      return @recommended_lunch = "You seem to be severely underweight or obese, we recommend to go to a doctor or dietician."
    elsif @compute_bmi == 16 || @compute_bmi < 18.4
      meal_type.each do |meal_type|
        result = Edamam::Client.get_recommendations("high-protein", "dairy", meal_type)

        if meal_type == "Breakfast"
          return @recommended_breakfast = result[:data]['hits'][0][0]
        elsif meal_type == "Lunch"
          return @recommended_lunch = result[:data]['hits'][0]
        else 
          return @recommended_dinner = result[:data]['hits'][0]
        end
      end
    elsif @compute_bmi == 18.5 || @compute_bmi < 24.9
      meal_type.each do |meal_type|
        result = Edamam::Client.get_recommendations("balanced", "dairy", meal_type)

        if meal_type == "Breakfast"
          return @recommended_breakfast = result[:data]['hits'][0]
        elsif meal_type == "Lunch"
          return @recommended_lunch = result[:data]['hits'][0]
        else 
          return @recommended_dinner = result[:data]['hits'][0]
        end
      end
    elsif @compute_bmi == 25 || @compute_bmi < 29.9
      meal_type.each do |meal_type|
        result = Edamam::Client.get_recommendations("high-fiber", "dairy", meal_type)

        if meal_type == "Breakfast"
          return @recommended_breakfast = result[:data]['hits'][0]
        elsif meal_type == "Lunch"
          return @recommended_lunch = result[:data]['hits'][0]
        else 
          return @recommended_dinner = result[:data]['hits'][0]
        end
      end
    elsif @compute_bmi == 30 || @compute_bmi < 34.9
      meal_type.each do |meal_type|
        result = Edamam::Client.get_recommendations("low-carb", "dairy", meal_type)

        if meal_type == "Breakfast"
          return @recommended_breakfast = result[:data]['hits'][0]
        elsif meal_type == "Lunch"
          return @recommended_lunch = result[:data]['hits'][0]
        else 
          return @recommended_dinner = result[:data]['hits'][0]
        end
      end
    elsif @compute_bmi == 35 || @compute_bmi < 39.9
      meal_type.each do |meal_type|
        result = Edamam::Client.get_recommendations("low-fat", "dairy", meal_type)

        if meal_type == "Breakfast"
          return @recommended_breakfast = result[:data]['hits'][0]
        elsif meal_type == "Lunch"
          return @recommended_lunch = result[:data]['hits'][0]
        else 
          return @recommended_dinner = result[:data]['hits'][0]
        end
      end
    end

  end
end