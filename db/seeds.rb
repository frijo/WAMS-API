# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.destroy_all
Meal.destroy_all
Ingredient.destroy_all


arroz = Ingredient.create([{name: 'Arroz',quantity: 5.00,cost_price: 2000.00,unit_type: 'KG'}])
frijoles =Ingredient.create!([{name: 'Frijoles',quantity: 4.00,cost_price: 1500.00,unit_type: 'KG'}])
tomates= Ingredient.create!([{name: 'Tomate',quantity: 2.00,cost_price: 2500.00,unit_type: 'KG'}])
papaya= Ingredient.create!([{name: 'Papaya',quantity: 1.00,cost_price: 500.00,unit_type: 'Uni'}])
leche = Ingredient.create!([{name: 'Leche',quantity: 1.00,cost_price: 800.00,unit_type: 'KG'}])
p "Se crearon  #{Ingredient.count} Ingredientes"

arrozyfrijoles = Meal.create([{name: 'Arroz y Frijoles',meal_type: 'Main',meal_cost: 900.00,sell_price: 1500.00,image: "aqui debe ir una imagen",recipe_description:' Descripcion de la receta para Arroz y Frijoles'}])

arrozytomate = Meal.create!([{name: 'Arroz y Tomate',meal_type: 'Main',meal_cost: 1500.00,sell_price: 2500.00,image: "aqui debe ir una imagen",recipe_description:' Descripcion de la receta para Arroz y Tomate'}])
batidodepapaya = Meal.create!([{name: 'batido de Papaya',meal_type: 'MilkShake',meal_cost: 1500.00,sell_price: 2500.00,image: "aqui debe ir una imagen",recipe_description:' Descripcion de la receta para batido de papaya '}])

p "Se crearon  #{Meal.count} Comidas"

recetas = Recipe.create!([{ingredient_id: Ingredient.first.id,meal_id:Meal.first.id,quantity:2},{ingredient_id:Ingredient.second.id,meal_id:Meal.first.id,quantity:1},{ingredient_id:Ingredient.first.id,meal_id:Meal.second.id,quantity:2},{ingredient_id:Ingredient.third.id,meal_id:Meal.second.id,quantity:1},{ingredient_id:Ingredient.fourth.id,meal_id:Meal.third.id,quantity:1},{ingredient_id:Ingredient.fifth.id,meal_id:Meal.third.id,quantity:4}])
p "Se crearon las recetas de  las comidas tambien"