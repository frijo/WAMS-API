module Api
  module V1
	class UsersController < ApplicationController
		#include Knock::Authenticable
		before_action :authenticate_user,  only: [:index, :current, :update]
  		before_action :set_user, only: [:destroy]
  		before_action :set_current_user, only: [:show]
  		before_action :authorize_as_admin, only: [:destroy]
		before_action :authorize, only: [:update]
		



		def index
			render json:{status:200,msg:'Logged-in'}
		end

		def current
		    current_user.update!(last_login: Time.now)
		     render json: { status: 200, msg: "You are currently method" }

		end
		def get_current_User
			@user = User.find(current_user.id)
		end
		def set_current_user
			@user = User.find(current_user.id)
			render json: @user, serializer: UserSerializer, adapter: :json 
		end
		def show
			render json: current_user
		end
		
		def create
			user = User.new(user_params)
			if user.save
				render json: user, serializer: UserSerializer, adapter: :json  
            
            else              
              # render json: user.errors, status: :unprocessable_entity
              render json: { status: 'ERROR',message: 'Usuario no se pudo crear',data:user.errors},status: :unprocessable_entity
            end
		end
		
		def update
           user = User.find(params[:id])
          if user.update(user_params)
            render json: user, serializer: UserSerializer, adapter: :json
          else
            render json: user.errors, status: :unprocessable_entity
          end          
        end
		
		def destroy
			user = User.find(params[:id])
            user.destroy

            render json: user, serializer: UserSerializer, adapter: :json  
        end
		private

		# Adding a method to check if current_user can update itself. 
		# This uses our UserModel method.
		def authorize
		    return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
		end
		
		def set_user
			@user = User.find(params[:id])
		end
		def user_params			
            params.require(:user).permit(:username, :role,:email, :password,:password_confirmation,:image)
		end

	end
  end
end
