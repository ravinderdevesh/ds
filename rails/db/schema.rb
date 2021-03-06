# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170325173700) do

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "time"
    t.string   "vedio_link"
    t.string   "image_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "raw_veg_id"
  end

  create_table "dishes_raw_vegs", id: false, force: :cascade do |t|
    t.integer "dish_id",    null: false
    t.integer "raw_veg_id", null: false
  end

  create_table "info_dishes", force: :cascade do |t|
    t.string   "place"
    t.integer  "dish_id"
    t.string   "nutrition"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "raw_vegs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dish_id"
  end

end
