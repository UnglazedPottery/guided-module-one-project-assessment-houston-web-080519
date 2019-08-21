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

ActiveRecord::Schema.define(version: 2019_08_19_212132) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "image_url"
    t.string "about_me"
  end

  create_table "cookbooks", force: :cascade do |t|
    t.string "title"
    t.string "image_url"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "author_id"
    t.integer "cookbook_id"
    t.integer "cook_time"
    t.string "image_url"
    t.string "ingredients"
    t.string "directions"
  end

end
