class ItemAsset < ActiveRecord::Base
  attr_accessible :title, :body, :image
  belongs_to :item
  
  mount_uploader :image, ItemUploader
end
