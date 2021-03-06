class Meal < ApplicationRecord
	
	has_many :recipes,inverse_of: :meal, dependent: :destroy
 	has_many :ingredients, through: :recipes,:foreign_key => :ingredient_id

 	has_many :bill_meals
 	has_many :bills, through: :bill_meals,:foreign_key => :meal_id
 	
 	has_many :order_meals
 	has_many :orders, through: :order_meals,:foreign_key => :order_id

  	accepts_nested_attributes_for :recipes,allow_destroy: true ,reject_if: :reject_empty_recipes ,update_only: true
  	#lambda {|attributes| attributes[:ingredient_id].blank? or attributes[:quantity].blank?}
  	#before_save :reject_empty_recipes
  	
  	scope :with_active_status, -> { where(status: 'active') }  
  	
  	def mark_children_for_removal
	  recipes.each do |recipe|
	    recipe.mark_for_destruction if recipe.ingredient_id.blank?
	  end
	end

	def reject_empty_recipes(attributes)

	    if attributes[:ingredient_id].blank? || attributes[:quantity].blank?
	    	puts "en reject"
	    	recipes= Meal.recipes
	    	recipes.delete
	   
	      
	    end
  	end 

end
