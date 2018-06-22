module Api
  module V1
	class SessionsController < ApplicationController
		before_action :require_user, only: [:logout]
	  	def login
	  	end
	  	
	  	def authentication
		  @user = User.find_by_nick_name(params[:session][:nick_name])
		  if @user && @user.authenticate(params[:session][:password])
		    session[:user_id] = @user.id
		    redirect_to '/main'
		  else
		    redirect_to '/login'
		  end 
		end
		
		def logout
			session[:user_id]=nil
	    	redirect_to '/'    	
		end
	end
  end
end
