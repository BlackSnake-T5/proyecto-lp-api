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

ActiveRecord::Schema.define(version: 2021_02_01_195015) do

  create_table "adopcions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "adopter_id", null: false
    t.bigint "donante_id", null: false
    t.bigint "pets_id", null: false
    t.string "entregado", default: "no-entregado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adopter_id"], name: "index_adopcions_on_adopter_id"
    t.index ["donante_id"], name: "index_adopcions_on_donante_id"
    t.index ["pets_id"], name: "index_adopcions_on_pets_id"
  end

  create_table "pets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type_of_pet"
    t.string "breed"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "adopted", default: false
  end

  create_table "profiles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "state", default: true
  end

  add_foreign_key "adopcions", "pets", column: "pets_id"
  add_foreign_key "adopcions", "users", column: "adopter_id"
  add_foreign_key "adopcions", "users", column: "donante_id"
end
