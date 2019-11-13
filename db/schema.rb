# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 1_573_492_418) do
  create_table 'departures', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'city', null: false
    t.string 'flight', null: false
    t.string 'time', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[city flight], name: 'index_departures_on_city_and_flight'
  end

  create_table 'notes', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.integer 'temperature', null: false
    t.string 'text', null: false
    t.bigint 'departure_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['departure_id'], name: 'index_notes_on_departure_id'
  end
end
