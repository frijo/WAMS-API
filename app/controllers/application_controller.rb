
	# class ApplicationController < ActionController::API
	# 	 # after_filter :cors_set_access_control_headers

	#   # def cors_set_access_control_headers
	#   #   headers['Access-Control-Allow-Origin'] = 'http://localhost:4200'
	#   #   headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
	#   #   headers['Access-Control-Request-Method'] = '*'
	#   #   headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
	#   # end

	#   # 	before_action :authenticate_request
	#   # attr_reader :current_user

	#   # private

	#   # def authenticate_request
	#   #   @current_user = AuthorizeApiRequest.call(request.headers).result
	#   #   render json: { error: 'Not Authorized' }, status: 401 unless @current_user
	#   # end
	#   	include Knock::Authenticable
 #  		undef_method :current_user
 #  		def return_unauthorized
 #    		render status: :unauthorized
	# 	end
 #  		protected
  
 #  		# Method for checking if current_user is admin or not.
 #  		def authorize_as_admin
 #    		return_unauthorized unless !current_user.nil? && current_user.is_admin?
	# 	end

	# end
