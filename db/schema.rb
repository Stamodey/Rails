ActiveRecord::Schema[8.0].define(version: 2025_01_24_204043) do

  enable_extension "pg_catalog.plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "booking_date"
    t.bigint "photographer_id", null: false
    t.bigint "client_id", null: false
    t.bigint "service_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["photographer_id"], name: "index_bookings_on_photographer_id"
    t.index ["service_id"], name: "index_bookings_on_service_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photographers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.string "email"
    t.string "portfolio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "clients"
  add_foreign_key "bookings", "photographers"
  add_foreign_key "bookings", "services"
end
