UploadPrototype::Application.routes.draw do
  resources :items
  resources :item_assets, :only => [:create, :destroy]
  
  root "/items"
end
