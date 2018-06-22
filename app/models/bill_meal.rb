class BillMeal < ApplicationRecord
  belongs_to :meal
  # Metodo para reducir la cantidad de ingrediente
  before_save :set_avaible_quantity, if: :check_meal_ingredients_avaible?
  validate :check_ingredients_avaibles

  	def set_avaible_quantity
	  
	   self.meal.recipes.each do |recipe|
       		ingredient = recipe.ingredient
       		ingreQuantity= recipe.quantity * self.quantity
       		ingredient.updateNewAvaible(ingreQuantity)
       end
    end  
    
    def check_ingredients_avaibles
        	errors.add(:base, "No hay #{@ingredient.name} suficiente, disponible #{@ingredient.avaible}") unless check_meal_ingredients_avaible?
    end
    
    def check_meal_ingredients_avaible?
    	
    	if self.meal.status == "active"
    		self.meal.recipes.each do |recipe|
    		 
	    		ingredient = recipe.ingredient
	    		ingreQuantity= recipe.quantity * self.quantity
				
				if ingredient.avaible >= ingreQuantity
			  	  	
			  	  	 return true
			  	  	
			  	else
					
					@ingredient=ingredient
					return false	  		
					
			  	end
	    	end
			
    	end
    	return true    	 	 
	   	
    end

    
end
