class ItemsController < ApplicationController
  before_action :staf_i_prokutimit
  
  
  def show
    @user = current_user
    @item = Item.find(params[:id])
    @contract = @item.contracts
    if @user.department_id == 2
      render 'show'
    else
      render 'show_depo'
    end
  end
  
  def index
    #@items = Item.all
    @items = Item.search(params[:search])
    if @user.department_id == 2
      render 'index'
    else
      #puts @user.inspect
      @items = Item.artikujt_e_njesis(@user.department_id)
      render 'index_depo'
    end
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
  
  def search
    @items = Item.search params[:search]
  end
  
  private
  
  
    def staf_i_prokutimit
      @user = current_user
      puts @user.inspect
      redirect_to(root_path) unless @user.department_id == 6 || @user.department_id == 2
      
      
    end
    
    def item_params
      params.require(:item).permit(:emertimi, :pershkrimi, :unit_id)
    end
  
end
