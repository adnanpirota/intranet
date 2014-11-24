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
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Artikulli u regjistrua me sukses"
      @items = Item.all
    else
      render 'index'
    end
  end
  
  private
  
  
    def staf_i_prokutimit
      @user = current_user
      #puts @user.inspect
      redirect_to(root_path) unless @user.departamenti_id == 2
    end
    
    def item_params
      params.require(:item).permit(:emertimi, :pershkrimi)
    end
  
end
