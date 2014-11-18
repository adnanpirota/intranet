class ItemsController < ApplicationController
  before_action :staf_i_prokutimit
  
  
  def show
    @user = current_user
    @item = Item.find(params[:id])
    @contract = @item.contracts
  end
  
  def index
    @items = Item.all
  end
  
  
  private
  
  
    def staf_i_prokutimit
      @user = current_user
      #puts @user.inspect
      redirect_to(root_path) unless @user.departamenti_id == 2
    end
  
end
