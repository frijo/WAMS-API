class MealSerializer < ApplicationSerializer
  attributes :id, :name, :sell_price,:meal_cost,:status, :meal_type,:recipe_description
  has_many :recipes
  has_many :ingredients, through: :recipes
  
end
