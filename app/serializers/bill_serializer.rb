class BillSerializer < ApplicationSerializer
  attributes :id, :invoice_number,:invoice_date,:client_name,:client_phone,:sale_tax,:total_tax,:payment_type,:customer_pay_with
  has_many :bill_meals
  has_many :meals, through: :bill_meals
  belongs_to :user

end
