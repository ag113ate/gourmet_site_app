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

ActiveRecord::Schema.define(version: 20180828143337) do

  create_table "drinks", force: true do |t|
    t.integer  "temperature"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_menus", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_pictures", force: true do |t|
    t.string   "food_menus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pict_url"
    t.string   "pict_alt"
  end

# Could not dump table "reserve_lists" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "reserve_people", force: true do |t|
    t.date     "date"
    t.time     "time"
    t.integer  "people"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
