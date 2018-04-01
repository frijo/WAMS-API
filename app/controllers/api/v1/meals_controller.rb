module Api
  module V1
    class MealsController < ApplicationController

      before_action :set_meal, only: [:show, :edit, :update, :destroy]

      def index

        meals = Meal.all
        ingredients = Ingredient.all
        #response = {:meals=> meals,:ingredients=>ingredients}
        #render json: meals, adapter: :json
        #DE ESTA FORMA SE PUEDEN ENVIAR 2 OBJ JSON CON TODOS LOS DATOS CORRESPONDIENTES
        render json: {
          meals: ActiveModel::Serializer::CollectionSerializer.new(meals, each_serializer: MealSerializer),
          ingredients: ActiveModel::Serializer::CollectionSerializer.new(ingredients, each_serializer: IngredientSerializer)
        }
      end
      def show
        render json: @meal, serializer: MealSerializer, adapter: :json
      end
      
      def create
        meal = Meal.new(meal_params)

        if meal.save
          render json: meal, serializer: MealSerializer, adapter: :json
            #render json: { status: 'SUCCESS',message: 'Plato Creado',data:meal},status: :ok
        else
            render json: { status: 'ERROR',message: 'No se pudo crear el plato',data:meal},status: :unprocessable_entity
        end
      end

      def update
        
        #ELIMINA LAS ASOCIACIONES EXISTENTES CON EL PLATILLO SELECCIONADO... SE HACE ESTO DEBIDO A PROBLEMAS EN  ACTUALIZAR LOS HIJOS, EN CASO DE QUE DES-SELECCIONE UN ATTRIBUTO
        @meal.recipes.delete_all

        if @meal.update(meal_params)
            #render json: { status: 'SUCCESS',message: 'Plato Editado',data:@meal},status: :ok
            render json: @meal, serializer: MealSerializer, adapter: :json
        else
            render json: { status: 'ERROR',message: 'No se pudo Eitar los datos del plato',data:@meal},status: :unprocessable_entity
        end
      end
      def destroy
        @meal.destroy
        render json: { status: 'SUCCESS',message: 'Plato Eliminado',data:@meal},status: :ok
        
      end
      private
      def set_meal
         @meal = Meal.find(params[:id])
      end

        # Never trust parameters from the scary internet, only allow the white list through.
      def meal_params
          #params.require(:meal).permit(:name, :type_meal, :meal_cost, :sell_price, :image, :recipe_description,recipes_attributes:[{ingredient_ids:[]},:quantitys] )
          params.required(:meal).permit(:name,:meal_type,:meal_cost,:sell_price,:image,:recipe_description, recipes_attributes:[:id,:quantity,:ingredient_id,:meal_id,:_destroy])
      end

    end
  end
end


