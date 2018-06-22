class Ingredient < ApplicationRecord
	has_many :recipes
  	has_many :meals, through: :recipes,:foreign_key => :meal_id
  
	validates :name, :quantity, :cost_price,:unit_type, presence:{message: "Este campo no puede estar en blanco"}
  before_save :set_avaible, on: :create
  validate :check_quantity_for_unit_type
  #ASIGNAR VALOR DE AVAIBLE CUANDO SE CREA O EDITA UN INGREDIENTE
  
  def set_avaible  	
    self.avaible = self.quantity
  end
  def check_quantity_for_unit_type
    if self.unit_type !="KG" && self.quantity>0
        has_difference =self.quantity.to_i-self.quantity
        if has_difference !=0 
          errors.add(:base, "No se puede asignar este valor por que no es un numero entero.")
        end
    elsif self.quantity<=0
           errors.add(:base, "No se pudo asignar esta cantidad,tiene que ser mayor a 0.")   
    end
  end
  #Actualiza la catidad disponible cuando se se factura algun platillo
  def updateNewAvaible(quantity)
    
    if self.unit_type != "KG" 
      #Solo puede acceptar numeros naturales o enteros xq es Unidad
      naturalN = quantity.to_i # convierte numero float a integer       
      newAvaible= self.avaible- naturalN
      #self.update_column(:avaible, newAvaible.to_f)# se convierte numero entero a float de nuevo para que se pueda actualizar
    else
        newAvaible= self.avaible- quantity
       #self.update_column(:avaible, newAvaible)    
    end

  end
end
