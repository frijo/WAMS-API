class MealSerializer < ApplicationSerializer
  attributes :id, :name, :sell_price, :meal_type
  has_many :ingredients
  
end
