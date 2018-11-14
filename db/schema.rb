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

ActiveRecord::Schema.define(version: 20181105011252) do

  create_table "adjustments", force: :cascade do |t|
    t.integer  "promotion_action_id"
    t.integer  "promotable_id"
    t.string   "promotable_type"
    t.boolean  "eligible"
    t.decimal  "amount",              precision: 8, scale: 2, default: "0.0", null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.index ["promotable_id"], name: "index_adjustments_on_promotable_id"
    t.index ["promotion_action_id"], name: "index_adjustments_on_promotion_action_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "quantity",                               default: 0
    t.decimal  "price",          precision: 8, scale: 2, default: "0.0", null: false
    t.decimal  "total",          precision: 8, scale: 2, default: "0.0", null: false
    t.decimal  "discount_total", precision: 8, scale: 2, default: "0.0", null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "product_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "number",         limit: 15
    t.decimal  "total",                     precision: 8, scale: 2, default: "0.0", null: false
    t.decimal  "item_total",                precision: 8, scale: 2, default: "0.0", null: false
    t.decimal  "discount_total",            precision: 8, scale: 2, default: "0.0", null: false
    t.string   "state"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.index ["number"], name: "index_orders_on_number", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 2, default: "0.0", null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "promotion_actions", force: :cascade do |t|
    t.integer  "promotion_id"
    t.string   "type"
    t.text     "preferences"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["promotion_id"], name: "index_promotion_actions_on_promotion_id"
  end

  create_table "promotion_rules", force: :cascade do |t|
    t.integer  "promotion_id"
    t.string   "type"
    t.text     "preferences"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["promotion_id"], name: "index_promotion_rules_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "name",          limit: 256
    t.string   "code",          limit: 15
    t.datetime "expiry_date"
    t.boolean  "default_apply"
    t.text     "description"
    t.integer  "usage_limit"
    t.integer  "priority",                  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["code"], name: "index_promotions_on_code", unique: true
  end

end
