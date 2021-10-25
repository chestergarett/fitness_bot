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

ActiveRecord::Schema.define(version: 2021_10_20_173954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_access_tokens_on_user_id"
  end

  create_table "client_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.float "height"
    t.float "current_weight"
    t.float "goal_weight"
    t.string "sex"
    t.integer "age"
    t.string "workout_frequency"
    t.string "body_type"
    t.datetime "target_date"
    t.string "food_preference"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_client_profiles_on_user_id"
  end

  create_table "diet_plans", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_options", force: :cascade do |t|
    t.integer "food_id"
    t.integer "diet_plan_id"
    t.string "meal_type"
    t.string "dish_type"
    t.string "diet_type"
    t.string "cuisine_type"
    t.string "main_ingredient"
    t.integer "no_of_ingredients"
    t.string "health_label"
    t.integer "calories"
    t.string "excluded"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "ingredients"
    t.string "media"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.string "name"
    t.string "url"
    t.string "avatar_url"
    t.string "provider"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_plans", force: :cascade do |t|
    t.string "bodyPart"
    t.string "equipment"
    t.string "gifUrl"
    t.integer "workout_id"
    t.string "name"
    t.string "target"
    t.string "status"
    t.datetime "startDate"
    t.datetime "endDate"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reps"
    t.string "sets"
    t.index ["user_id"], name: "index_workout_plans_on_user_id"
  end

  add_foreign_key "access_tokens", "users"
  add_foreign_key "client_profiles", "users"
  add_foreign_key "workout_plans", "users"
end
