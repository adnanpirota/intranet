class ItemsController < ApplicationController
  
  def show
    @user = current_user
    @item = Item.find(params[:id])
    @contract = @item.contracts
  end
  
end
