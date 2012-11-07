class Item < ActiveRecord::Base
  attr_accessible :title, :description
  has_many :item_assets,  :dependent => :destroy
end
