module Api
	module V1
		class OrdersController < ApplicationController
			before_action :set_order, only: [:update, :show, :destroy]
			before_action :authenticate_user,  only: [:create,:update]
        	before_action :authorize_as_admin, only: [:destroy]



			def index
				orders = Order.all
				render json: {
	          			orders: ActiveModel::Serializer::CollectionSerializer.new(orders, each_serializer: OrderSerializer)
	        	}
			end
			
			def show
				render json: @order, serializer: billSerializer, adapter: :json
			end
			def create
				order = Order.new(order_params)
				order.order_date= DateTime.now

		        if order.save
		          render json: order, serializer: OrderSerializer, adapter: :json

		        else
		            render json: { status: 'ERROR',message: 'No se pudo crear la Orden',data:order.errors.messages},status: :unprocessable_entity
		        end	
			end
			def update
				@order.order_meals.delete_all
				@order.order_places.delete_all
				if @order.update(order_params)
		            render json: @order, serializer: OrderSerializer, adapter: :json
		        else
		            render json: { status: 'ERROR',message: 'No se pudo Eitar la Orden',data:@order},status: :unprocessable_entity
		        end
			end
			def destroy
	        	@order.destroy
	        	render json: { status: 'SUCCESS',message: 'Orden eliminada',data:@bill},status: :ok
	        
	      	end

			private
			def set_order
				@order= Order.find(params[:id])
			end
			def order_params
				params.required(:order).permit(:order_date,:client_name,:client_phone,:sales_taxes,:total_tax,:payment_type,:user_id,
				 order_meals_attributes:[:id,:quantity,:total,:meal_id,:order_id,:_destroy], 
				 order_places_attributes:[:id,:place_id,:order_id,:_destroy])
			end


		end
	end
end
