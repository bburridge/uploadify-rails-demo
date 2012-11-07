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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121106165659) do

  create_table "item_assets", :force => true do |t|
    t.string   "source_thumbnail_url"
    t.string   "source_original_url"
    t.integer  "width"
    t.integer  "height"
    t.string   "image"
    t.string   "cloudinary_image",                :limit => 1000
    t.string   "source_mid_url"
    t.string   "source_mid_url_dimensions",       :limit => 25
    t.string   "source_thumbnail_url_dimensions", :limit => 25
    t.string   "source_original_url_dimensions",  :limit => 25
    t.text     "content"
    t.string   "content_type",                    :limit => 10
    t.integer  "item_id"
    t.integer  "position"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "title"
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

end
