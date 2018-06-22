class OrderSerializer < ApplicationSerializer
  attributes :id, :order_number,:order_date,:client_name,:client_phone,:sales_taxes,:total_tax,:payment_type,:created_at
 # has_many :order_meals
  has_many :meals, through: :order_meals
  
  #has_many :order_places
  has_many :places, through: :order_places
  
  belongs_to :user
end
