class Recipe < ApplicationRecord
  belongs_to :ingredient
  belongs_to :meal

 
  # Metodo para reducir la cantidad de ingrediente
  #before_save :setAvaibleQuantity, if: :checkIngredientAvaible?
  
  # def checkIngredientAvaible?
 	# if self.ingredient.avaible >= self.quantity
  # 		 true
  # 	else
  # 		false
  # 	end
  # end

  # def setAvaibleQuantity


  # 	newAvaible = self.ingredient.avaible-self.quantity
 	# self.ingredient.updateNewAvaible(self.quantity)
  	 
  # end


end
