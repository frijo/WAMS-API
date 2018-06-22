module Api
  module V1
		class PlacesController < ApplicationController
			before_action :set_place, only: [:destroy]
			before_action :authenticate_user,  only: [:create,:destroy]
        	before_action :authorize_as_admin, only: [:destroy]
			
			def index
				places = Place.all
				render json: {
            		places: ActiveModel::Serializer::CollectionSerializer.new(places, each_serializer: PlaceSerializer)
          		}
			end
			def create
				place = Place.new(place_params)

		        if place.save
		          render json: place, serializer: PlaceSerializer, adapter: :json
		           
		        else
		            render json: { status: 'ERROR',message: 'No se pudo crear lugar',data:place},status: :unprocessable_entity
		        end
			end
			def destroy
				@place.destroy
        		render json: { status: 'SUCCESS',message: 'Lugar Eliminado',data:@place},status: :ok
			end
			
			private
			def place_params
				params.required(:place).permit(:name)
			end
			def set_place
				@place = Place.find(params[:id])
			end

		end
  end
end
