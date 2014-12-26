class WarehouseDetailsController < ApplicationController
  before_action :staf_i_depos, :fatura_ose_pranimi_aktual
  respond_to :html, :js
  
  
  def index
    @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
    @user = current_user
    #logger.debug "TUNG ... numri i komenteve per ket kontrate osht: #{@contract.contract_comments.first.inspect}"
    
    @warehouse_details = @warehouse_document.warehouse_details
  end
  
  def daljedet
    @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
    @warehouse_details = @warehouse_document.warehouse_details
  end
  
  def show
    @warehouse_document = WarehouseDocument.find(params{:warehouse_document_id})
    @warehouse_details = @warehouse_document.warehouse_details
  end
  
  
  
  def new
    @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
    @warehouse_detail = WarehouseDetail.new
  end
  
  def newart_dalje
    @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
    @warehouse_detail = WarehouseDetail.new
  end
  
  

  def create
    puts "jom ne veq-create"
    @warehouse_detail = @warehouse_document.warehouse_details.build(warehouse_details_params)
    @warehouse_detail.update_attribute(:pranimdalje, false)
    
    
    if @warehouse_detail.save
      
      flash[:success] = "Artikulli i shtua"
      @warehouse_details = @warehouse_document.warehouse_details
      
    else
      flash[:failure] = "Gabim!!!"
      render 'index'
    end
  end
  
  def create_art_dalje
    puts "jom ne create_art_dalje"
    
    @warehouse_detail = @warehouse_document.warehouse_details.build(warehouse_details_params)
    
    #gjetja e cmimit te fundit
    @artikujt = WarehouseDetail.per_cmim(@warehouse_detail.item_id).last
    #puts @artikujt.cmimi
    
    
    @warehouse_detail.update_attribute(:cmimi, @artikujt.cmimi)
    
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
