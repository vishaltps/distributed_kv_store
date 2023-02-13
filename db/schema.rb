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

ActiveRecord::Schema[7.0].define(version: 2023_02_11_180326) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stores", id: false, force: :cascade do |t|
    t.string "key", null: false
    t.text "values"
    t.integer "ttl", null: false
    t.index ["key"], name: "index_stores_on_key", unique: true
    t.index ["ttl"], name: "index_stores_on_ttl"
  end

end
