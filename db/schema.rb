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

ActiveRecord::Schema.define(version: 20180307151554) do

  create_table "addresses", force: :cascade do |t|
    t.string "coin", null: false
    t.string "alias", null: false
    t.string "address", null: false
    t.string "uuid", null: false
    t.string "secret", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_addresses_on_address"
    t.index ["alias"], name: "index_addresses_on_alias"
    t.index ["coin", "alias"], name: "index_addresses_on_coin_and_alias", unique: true
    t.index ["secret"], name: "index_addresses_on_secret"
    t.index ["uuid"], name: "index_addresses_on_uuid"
  end

end
