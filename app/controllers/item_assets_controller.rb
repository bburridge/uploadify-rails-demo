class ItemAssetsController < ApplicationController
  
  def create
    @item_asset = ItemAsset.new(params[:item_asset])
    
    respond_to do |format|
      unless @item_asset.save
        flash[:error] = 'Asset could not be uploaded'
      end
      format.js do
        render :text => render_to_string(:partial => 'item_assets/asset', :locals => {:asset => @item_asset})
      end
      format.html do
        render :partial => 'item_assets/asset', :locals => {:asset => @item_asset}
      end
    end
  end
  
  def destroy
    
  end

end
