class CreateItems < ActiveRecord::Migration
  def change
    create_table "items", :force => true do |t|
      t.string   "title"
      t.datetime "created_at",                                             :null => false
      t.datetime "updated_at",                                             :null => false
      t.text     "description"
    end
  end
end
