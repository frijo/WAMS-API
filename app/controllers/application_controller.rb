class ApplicationController < ActionController::API
	 # after_filter :cors_set_access_control_headers

  # def cors_set_access_control_headers
  #   headers['Access-Control-Allow-Origin'] = 'http://localhost:4200'
  #   headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
  #   headers['Access-Control-Request-Method'] = '*'
  #   headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  # end
end
