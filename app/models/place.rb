class Place < ApplicationRecord
	validates_presence_of :name
	validates :name, uniqueness:{message: "Este lugar ya existe"}

	has_many :order_places, dependent: :destroy
 	has_many :orders, through: :order_places,:foreign_key => :places_id
end
