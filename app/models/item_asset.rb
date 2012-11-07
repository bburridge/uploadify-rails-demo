class ItemAsset < ActiveRecord::Base
  attr_accessible :title, :body, :image, :item_id
  belongs_to :item
  
  mount_uploader :image, ItemUploader
end
