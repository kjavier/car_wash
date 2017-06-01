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

ActiveRecord::Schema.define(version: 20170601151534) do

  create_table "sale_transitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "to_state", null: false
    t.text "metadata"
    t.integer "sort_key", null: false
    t.integer "sale_id", null: false
    t.boolean "most_recent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id", "most_recent"], name: "index_sale_transitions_parent_most_recent", unique: true
    t.index ["sale_id", "sort_key"], name: "index_sale_transitions_parent_sort", unique: true
  end

  create_table "sales", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "vehicle_id"
    t.float "amount", limit: 24, default: 0.0
    t.boolean "has_mud_on_bed", default: false
    t.boolean "with_bed_let_down", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_sales_on_vehicle_id"
  end

  create_table "vehicle_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.float "price", limit: 24, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "license_plate", null: false
    t.bigint "vehicle_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_type_id"], name: "index_vehicles_on_vehicle_type_id"
  end

  add_foreign_key "sales", "vehicles"
end
