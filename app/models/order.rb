class Order < ApplicationRecord
	has_many :order_meals, dependent: :destroy
 	has_many :meals, through: :order_meals,:foreign_key => :order_id
 	
 	has_many :order_places, dependent: :destroy
 	has_many :places, through: :order_places,:foreign_key => :order_id


 	belongs_to :user

 	accepts_nested_attributes_for :order_meals,allow_destroy: true 
 	accepts_nested_attributes_for :order_places,allow_destroy: true
 	 	
 	validates :order_number, uniqueness:{message: "Surgio Problema al crear Orden"}
 	before_save :setOrderNumber,:updateOrderNumbers 	
	
	def setOrderNumber
		if self.new_record?
			order = OrderNumber.first
			self.order_number = order.next_order_number
		end
	end
	def updateOrderNumbers
		if self.new_record?
			order_update = OrderNumber.first
			order_update.order_number = order_update.next_order_number
			order_update.next_order_number = order_update.next_order_number+1
			order_update.save
		end
	end

 	

end
