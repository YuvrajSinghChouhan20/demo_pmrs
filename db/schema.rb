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

ActiveRecord::Schema[7.1].define(version: 2024_01_12_100518) do
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agreements", force: :cascade do |t|
    t.string "duration"
    t.date "start_date"
    t.date "end_date"
    t.integer "amount"
    t.integer "agreement_status"
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "security_amount"
    t.text "terms_and_conditions", array: true
    t.bigint "maintance_amount"
    t.bigint "booking_id", null: false
    t.index ["booking_id"], name: "index_agreements_on_booking_id"
    t.index ["property_id"], name: "index_agreements_on_property_id"
    t.index ["user_id"], name: "index_agreements_on_user_id"
  end

  create_table "agreements_documents", id: false, force: :cascade do |t|
    t.bigint "agreement_id", null: false
    t.bigint "document_id", null: false
    t.index ["agreement_id", "document_id"], name: "index_agreements_documents_on_agreement_id_and_document_id"
    t.index ["document_id", "agreement_id"], name: "index_agreements_documents_on_document_id_and_agreement_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "booking_status"
    t.string "booking_date"
    t.string "booking_for"
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_bookings_on_property_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "document_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "payment_amount"
    t.date "payment_date"
    t.integer "payment_status"
    t.string "paymentable_type", null: false
    t.bigint "paymentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["paymentable_type", "paymentable_id"], name: "index_payments_on_paymentable"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_name"
    t.string "property_about"
    t.string "state"
    t.string "city"
    t.integer "zipcode"
    t.string "property_type"
    t.string "sub_property_type"
    t.string "listed_for"
    t.string "property_size"
    t.text "address"
    t.integer "price"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "property_status", default: 1
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.integer "rent_amount"
    t.integer "rent_status"
    t.date "due_date"
    t.bigint "agreement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_id"], name: "index_rents_on_agreement_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "ratings"
    t.string "title"
    t.text "description"
    t.boolean "residented"
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_reviews_on_property_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "security_deposits", force: :cascade do |t|
    t.integer "deposit_amount"
    t.integer "deposit_status"
    t.bigint "agreement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_id"], name: "index_security_deposits_on_agreement_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.bigint "mobile"
    t.string "city"
    t.text "address"
    t.bigint "zip"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agreements", "bookings"
  add_foreign_key "agreements", "properties"
  add_foreign_key "agreements", "users"
  add_foreign_key "bookings", "properties"
  add_foreign_key "bookings", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "properties", "users"
  add_foreign_key "rents", "agreements"
  add_foreign_key "reviews", "properties"
  add_foreign_key "reviews", "users"
  add_foreign_key "security_deposits", "agreements"
end
