class Ingredient < ApplicationRecord
	has_many :recipes
  	has_many :meals, through: :recipes,:foreign_key => :meal_id
  
	validates :name, :quantity, :cost_price,:unit_type, presence:{message: "Este campo no puede estar en blanco"}

  	before_save :set_avaible

#ASIGNAR VALOR DE AVAIBLE CUANDO SE CREA O EDITA UN INGREDIENTE
  def set_avaible
  	# if self.new_record?
  	# 	self.avaible = self.quantity
  	# else
  	# 	self.avaible-=self.quantity if self.avaible >= self.quantity  #usar esto cuando se rebajen los ingredientes de una cuenta
  	# end
    self.avaible = self.quantity
  end
end
