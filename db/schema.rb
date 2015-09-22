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

ActiveRecord::Schema.define(version: 20150922161326) do

  create_table "events", primary_key: "event_id", force: :cascade do |t|
    t.string "name"
    t.string "date"
  end

  create_table "people", primary_key: "person_id", force: :cascade do |t|
    t.string "name"
    t.string "dob"
    t.string "gender"
    t.string "zipcode"
  end

  create_table "registrations", primary_key: "registration_id", force: :cascade do |t|
    t.integer "people_id"
    t.integer "events_id"
    t.string  "status"
  end

  add_index "registrations", ["events_id"], name: "index_registrations_on_events_id"
  add_index "registrations", ["people_id"], name: "index_registrations_on_people_id"

end
