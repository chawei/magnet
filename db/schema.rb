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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110418011616) do

  create_table "disabling_logs", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "button_count"
    t.string   "button_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
    t.string   "request_ip"
    t.integer  "lang_mapping_id"
    t.string   "city"
    t.string   "country"
  end

  create_table "lang_mappings", :force => true do |t|
    t.string   "lang_name"
    t.string   "locale"
    t.string   "like_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "like_buttons", :force => true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "city"
    t.string   "country"
    t.string   "lng"
    t.string   "lat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shared_images", :force => true do |t|
    t.string   "data_file_name"
    t.integer  "data_file_size"
    t.string   "data_content_type"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
