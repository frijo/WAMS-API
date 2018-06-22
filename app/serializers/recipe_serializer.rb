class RecipeSerializer  < ActiveModel::Serializer
  attributes :id, :ingredient_id, :meal_id,:quantity
  belongs_to :meal
  belongs_to :ingredient
end