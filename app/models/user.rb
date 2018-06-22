require 'bcrypt'

class User < ApplicationRecord
	#encrypted_password
  	include BCrypt
	has_many :bills
	has_many :orders
	
	has_secure_password
	
	before_validation { 
    	(self.email = self.email.to_s.downcase) && (self.username = self.username.to_s.downcase) 
	}
	validates_length_of       :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
	validates_confirmation_of :password, allow_nil: true, allow_blank: false
	validates_presence_of     :email
	validates_presence_of :username
	validates :username, uniqueness:{message: "Este username ya se encuentra registrado"} 
	validates :email, uniqueness:{message: "Este email ya se encuentra registrado"}  
  	validates :password, confirmation:{ message: " Las contraseñas deben coincidir" }
  	
  	# def self.from_token_payload payload
   #  	payload['sub']
  	# end
  
  	def can_modify_user?(user_id)
    	role == 'Admin' || id.to_s == user_id.to_s
  	end

  	def is_admin?
    	role == 'Admin'
	end


end
