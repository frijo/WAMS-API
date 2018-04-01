module Api
  module V1
    class IngredientsController < ApplicationController
        before_action :set_ingredient, only: [ :show,:update, :destroy]
        def index
          ingredients = Ingredient.all
          #render json: ingredients

          render json: {
            ingredients: ActiveModel::Serializer::CollectionSerializer.new(ingredients, each_serializer: IngredientSerializer)
          }
        end
        
        def show
          render json: @ingredient, serializer: IngredientSerializer, adapter: :json
        end

        def create
          ingredient = Ingredient.new(ingredient_params)

            if ingredient.save             
               #render json: ingredient, status: 201
              # render json: ingredient, each_serializer: IngredientSerializer, root: false
               #render json: { status: 'SUCCESS',message: 'Ingrediente Creado',data:ingredient},status: :ok
                # render json: {
                #    ingredient: ActiveModelSerializers::SerializableResource.new(ingredient).as_json
                # }
                render json: ingredient, serializer: IngredientSerializer, adapter: :json
              
            
            else              
              # render json: ingredient.errors, status: :unprocessable_entity
              render json: { status: 'ERROR',message: 'Ingrediente no se pudo crear',data:ingredient.errors},status: :unprocessable_entity
            end          
        end

        def update
          if @ingredient.update(ingredient_params)
            # render json: @ingredient, status: 201
            #render json: { status: 'SUCCESS',message: 'Ingrediente Editado',data:@ingredient},status: :ok  
            render json: @ingredient, serializer: IngredientSerializer, adapter: :json
          else
            render json: @ingredient.errors, status: :unprocessable_entity
          end          
        end

        # DELETE /ingredients/1
        # DELETE /ingredients/1.json
        def destroy
            @ingredient.destroy
            # render json:@ingredient,status: 201,
            render json: @ingredient, serializer: IngredientSerializer, adapter: :json  
        end

          private
          # Use callbacks to share common setup or constraints between actions.
          def set_ingredient
            @ingredient = Ingredient.find(params[:id])
          end
          # Never trust parameters from the scary internet, only allow the white list through.
          def ingredient_params
            params.require(:ingredient).permit(:name, :quantity, :avaible, :cost_price, :unit_type)       
          end
    end
  end
end