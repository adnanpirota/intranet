class WarehouseDetailsController < ApplicationController
  before_action :staf_i_depos, :fatura_ose_pranimi_aktual
  respond_to :html, :js
  
  
  def index
    @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
    @user = current_user
    #logger.debug "TUNG ... numri i komenteve per ket kontrate osht: #{@contract.contract_comments.first.inspect}"
    
    @warehouse_details = @warehouse_document.warehouse_details
    
  end
  
  def new
    @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
    @warehouse_detail = WarehouseDetail.new
  end

  def create
    @warehouse_detail = @warehouse_document.warehouse_details.build(warehouse_details_params)
    
    
    
    if @warehouse_detail.save
      
      flash[:success] = "Artikulli i shtua"
      @warehouse_details = @warehouse_document.warehouse_details
      
    else
      flash[:failure] = "Gabim!!!"
      render 'index'
    end
  end

  
  def show
  end
  
  
  
   private
   
    def fatura_ose_pranimi_aktual
      @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
    end
  
    def staf_i_depos
      @user = current_user
      #puts @user.inspect
      redirect_to(root_path) unless @user.department_id == 6 || @user.department_id == 5
    end
    
    def warehouse_details_params
      params.require(:warehouse_detail).permit(:item_id, :sasia, :cmimi)
    end
    
    
end
