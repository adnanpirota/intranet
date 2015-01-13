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
    @items = Item.tenjesis(@user.department_id)
    
    #@items = Item.search(params[:search])
      if params[:search]
        puts "paska search #{:search}"
        @items = Item.tenjesis(@user.department_id).starts_with(params[:search])
      else
        puts  "nuk paska search"
        @items = Item.tenjesis(@user.department_id)
      end
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.update_attribute(:department_id, @user.department_id)
    if @item.save
      flash[:success] = "Artikulli u regjistrua me sukses"
      @items = Item.tenjesis(@user.department_id)
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
      #redirect_to(root_path) unless @user.department_id == 6 || @user.department_id == 2
      redirect_to(root_path) unless @user.department_id == 2 || @user.department_id == 3 || @user.department_id == 6 || @user.admin == true
      
      
    end
    
    def item_params
      params.require(:item).permit(:emertimi, :pershkrimi, :unit_id)
    end
  
end
