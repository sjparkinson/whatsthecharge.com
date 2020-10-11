# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_11_113352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "charging_rates", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "Costs by charging speed for membership and pay-as-you-go plans.", force: :cascade do |t|
    t.string "rateable_type"
    t.uuid "rateable_id"
    t.text "description"
    t.integer "price_per_kwh_cents", default: 0, null: false
    t.string "price_per_kwh_currency", default: "USD", null: false
    t.integer "price_per_minute_cents", default: 0, null: false
    t.string "price_per_minute_currency", default: "USD", null: false
    t.string "currency", null: false, comment: "ISO 4217 three character currency code."
    t.integer "charging_rates", comment: "Charging speeds supported by this rate in kWh, e.g. 7, 22, and 50.", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["charging_rates"], name: "index_charging_rates_on_charging_rates", using: :gin
    t.index ["rateable_type", "rateable_id"], name: "index_charging_rates_on_rateable_type_and_rateable_id"
  end

  create_table "countries", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "Supported countries.", force: :cascade do |t|
    t.string "name", null: false
    t.string "countryCode", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["countryCode"], name: "index_countries_on_countryCode", unique: true
  end

  create_table "membership_plans", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "Network memberships, e.g. Source London's Full membership.", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.money "price_one_off", scale: 2, comment: "One-off cost to become a member, e.g. Source London's Flexi membership."
    t.money "price_per_month", scale: 2
    t.string "currency", null: false, comment: "ISO 4217 three character currency code."
    t.uuid "network_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["network_id"], name: "index_membership_plans_on_network_id"
  end

  create_table "networks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "url", null: false
    t.uuid "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_networks_on_country_id"
    t.index ["slug"], name: "index_networks_on_slug", unique: true
  end

  create_table "payg_plans", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "Network pay-as-you-go plans, e.g. Polar Instant.", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.uuid "network_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["network_id"], name: "index_payg_plans_on_network_id"
  end

  add_foreign_key "membership_plans", "networks"
  add_foreign_key "networks", "countries"
  add_foreign_key "payg_plans", "networks"
end
