class Bill < ApplicationRecord
	has_many :bill_meals, dependent: :destroy
 	has_many :meals, through: :bill_meals,:foreign_key => :meal_id
 	belongs_to :user
 	validates :invoice_number, uniqueness:{message: "Surgio Problema al crear Factura"}

	before_save :setInvoiceNumber,:updateInvoiceNumbers 	
	#validate :checkCustomerPayment, on: :create
	
	 
	
	def active_customer
	    errors.add(:customer_id, "is not active") unless customer.active?
	end
			
	
	def checkCustomerPayment
		
		 errors.add(:customer_pay_with, "Monto insuficiente para cancelar la cuenta") unless self.customer_pay_with >= self.total_tax
	end	


	def setInvoiceNumber
		invoice = InvoiceNumber.first
		self.invoice_number = invoice.next_invoice_number
	end
	def updateInvoiceNumbers
		invoice_update = InvoiceNumber.first
		invoice_update.invoice_number = invoice_update.next_invoice_number
		invoice_update.next_invoice_number = invoice_update.next_invoice_number+1
		invoice_update.save
	end


 	accepts_nested_attributes_for :bill_meals,allow_destroy: true ,update_only: true
end
