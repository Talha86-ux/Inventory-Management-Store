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

ActiveRecord::Schema.define(version: 2021_12_20_133825) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "business_domain"
    t.string "assign_manager"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "cnic"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_customers_on_company_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.decimal "price", null: false
    t.integer "quantity", null: false
    t.decimal "total_price"
    t.string "product"
    t.integer "products_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["products_id"], name: "index_line_items_on_products_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "company_name"
    t.decimal "sub_total"
    t.string "customer_list"
    t.integer "invoice_no"
    t.date "invoice_date"
    t.decimal "tax"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "quantity"
    t.string "supplied_by"
    t.integer "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "cnic"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_suppliers_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
