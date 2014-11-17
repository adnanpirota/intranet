class SuppliersController < ApplicationController
  before_action :staf_i_prokutimit
  respond_to :html, :js
  
  def show
    @user = current_user
    @supplier = Supplier.find(params[:id])
    @kontratat_e_furnitorit = @supplier.contracts
  end
  
  def index
    @suppliers = Supplier.all
  end
  
  def new
    @supplier = Supplier.new
  end
  
  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      flash[:success] = "Furnitori u regjistrua me sukses"
      @suppliers = Supplier.all
    else
      render 'index'
    end
  end
  
  
  
  private 
  
    def supplier_params
      params.require(:supplier).permit(:emri, :telefoni, :emaili) 
    end
    
    def staf_i_prokutimit
      @user = current_user
      #puts @user.inspect
      redirect_to(root_path) unless @user.departamenti_id == 2
    end
end
