class CreateItemAssets < ActiveRecord::Migration
  def change
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
  end
end
