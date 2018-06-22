module Api
  module V1
	class BillsController < ApplicationController
		before_action :set_bill, only: [ :show, :destroy]
		def index
			bills = Bill.all
			render json: {
          			bills: ActiveModel::Serializer::CollectionSerializer.new(bills, each_serializer: BillSerializer)#,
          			#ingredients: ActiveModel::Serializer::CollectionSerializer.new(ingredients, each_serializer: IngredientSerializer)
        	}
		end
		def show
			render json: @bill, serializer: billSerializer, adapter: :json
		end
		def create
			
			bill = Bill.new(bill_params)
			bill.invoice_date= DateTime.now
	        if bill.save
	          render json: bill, serializer: BillSerializer, adapter: :json
	            #render json: { status: 'SUCCESS',message: 'Plato Creado',data:bill},status: :ok
	        else
	        	
	        
	            render json: { status: 'ERROR',message:"No se pudo crear la Factura" ,data:bill.errors},status: :unprocessable_entity
	        end	
		end
		def destroy
        	@bill.destroy
        	render json: { status: 'SUCCESS',message: 'Factura eliminada',data:@bill},status: :ok
        
      	end

		private
		def set_bill
			@bill= Bill.find(params[:id])
		end
		def bill_params
			params.required(:bill).permit(:invoice_date,:client_name,:client_phone,:sale_tax,:total_tax,:payment_type,:user_id,:customer_pay_with, bill_meals_attributes:[:id,:quantity,:total,:meal_id,:bill_id,:_destroy])
		end


	end
  end
end

