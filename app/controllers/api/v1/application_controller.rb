module Api
  module V1
	class ApplicationController < ActionController::API
		
		include Knock::Authenticable
  		#undef_method :current_user
  		def return_unauthorized
    		render status: :unauthorized
		  end
  		protected
  
  		# Method for checking if current_user is admin or not.
  		def authorize_as_admin
    		return_unauthorized unless !current_user.nil? && current_user.is_admin?
		end

	end
  end
end