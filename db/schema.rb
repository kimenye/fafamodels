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

ActiveRecord::Schema.define(version: 20140429080537) do

  create_table "genders", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", force: true do |t|
    t.string   "height"
    t.string   "eye_colour"
    t.string   "hair_colour"
    t.string   "skin_colour"
    t.string   "shoe_size"
    t.string   "neck"
    t.string   "suit_size"
    t.string   "shoulders"
    t.string   "shirt_size"
    t.string   "inside_leg_size"
    t.string   "bust"
    t.string   "bra_size"
    t.string   "waist"
    t.string   "hips"
    t.string   "dress_size"
    t.string   "clothing_size_age"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "image_uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "gender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
