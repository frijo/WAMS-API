# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180606031352) do

  create_table "bill_meals", force: :cascade do |t|
    t.integer "meal_id"
    t.float "quantity"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bill_id"
    t.index ["bill_id"], name: "index_bill_meals_on_bill_id"
    t.index ["meal_id"], name: "index_bill_meals_on_meal_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "invoice_number"
    t.datetime "invoice_date"
    t.string "client_name"
    t.string "client_phone"
    t.float "sale_tax"
    t.float "total_tax"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.float "customer_pay_with"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unit_type"
    t.float "quantity"
    t.float "cost_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "avaible"
  end

  create_table "invoice_numbers", force: :cascade do |t|
    t.integer "invoice_number"
    t.integer "next_invoice_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "meal_type"
    t.string "image"
    t.float "meal_cost"
    t.float "sell_price"
    t.text "recipe_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "order_meals", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "order_id"
    t.float "quantity"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_order_meals_on_meal_id"
    t.index ["order_id"], name: "index_order_meals_on_order_id"
  end

  create_table "order_numbers", force: :cascade do |t|
    t.integer "order_number"
    t.integer "next_order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_places", force: :cascade do |t|
    t.integer "order_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_places_on_order_id"
    t.index ["place_id"], name: "index_order_places_on_place_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "order_number"
    t.datetime "order_date"
    t.string "client_name"
    t.string "client_phone"
    t.float "sales_taxes"
    t.float "total_tax"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.float "quantity"
    t.integer "ingredient_id"
    t.integer "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_recipes_on_ingredient_id"
    t.index ["meal_id"], name: "index_recipes_on_meal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "token"
    t.string "image"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_hash"
    t.string "password_digest"
    t.datetime "last_login"
  end

end
