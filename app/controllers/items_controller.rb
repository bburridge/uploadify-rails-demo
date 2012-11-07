class ItemsController < ApplicationController
  skip_before_filter  :verify_authenticity_token, :only => [:create, :update]
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.create
  end
  
  def create
    @item = Item.new(params[:item])
    # @item.user = current_user # set the gallery to be the current user
    if @item.save
      json_result = {:id => @item.id}.to_json
      render :status => :created, :text => json_result
    else
      json_result = {:id => nil}.to_json
      render :status => :unprocessable_entity, :text => json_result
    end
  end
  
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to items_url , notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
