# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_14_035331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "website_main"
    t.string "website_menu"
    t.string "suburb"
    t.string "street_name"
    t.string "street_number"
    t.bigint "postcode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["postcode_id"], name: "index_addresses_on_postcode_id"
  end

  create_table "board_listings", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_board_listings_on_board_id"
    t.index ["listing_id"], name: "index_board_listings_on_listing_id"
  end

  create_table "board_offers", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_board_offers_on_board_id"
    t.index ["offer_id"], name: "index_board_offers_on_offer_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "designer", null: false
    t.integer "length"
    t.integer "width"
    t.integer "volume"
    t.string "condition"
    t.string "fins"
    t.string "tail"
    t.string "attachments"
    t.text "description"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "meetup_date"
    t.time "meetup_time"
    t.bigint "address_id", null: false
    t.string "header"
    t.string "status"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_listings_on_address_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "offer_id", null: false
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_meetups_on_listing_id"
    t.index ["offer_id"], name: "index_meetups_on_offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.text "comment"
    t.string "status", default: "being considered"
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_offers_on_listing_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "postcodes", force: :cascade do |t|
    t.integer "number"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "phone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "postcodes"
  add_foreign_key "board_listings", "boards"
  add_foreign_key "board_listings", "listings"
  add_foreign_key "board_offers", "boards"
  add_foreign_key "board_offers", "offers"
  add_foreign_key "boards", "users"
  add_foreign_key "listings", "addresses"
  add_foreign_key "listings", "users"
  add_foreign_key "meetups", "listings"
  add_foreign_key "meetups", "offers"
  add_foreign_key "offers", "listings"
  add_foreign_key "offers", "users"
end
