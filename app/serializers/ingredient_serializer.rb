class IngredientSerializer < ApplicationSerializer
 attributes :id, :name, :cost_price, :unit_type,:quantity
  #has_many :meals
end