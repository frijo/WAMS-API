class IngredientSerializer < ApplicationSerializer
 attributes :id, :name, :cost_price, :unit_type,:quantity,:avaible
  #has_many :meals
end