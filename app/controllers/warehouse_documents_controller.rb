class WarehouseDocumentsController < ApplicationController
  
  before_action :staf_i_depos
  
  def index
    
    @warehouse_documents = WarehouseDocument.msillosi
  
  end
  
  def new
  
    
  end 
  
  def pranim_malli
    @warehouse_documents = WarehouseDocument.msillosi
    @warehouse_document = WarehouseDocument.new
    
    
  end 
  
  def create
    @warehouse_document = WarehouseDocument.new(warehouse_document_params)
    @warehouse_document.update_attribute(:depo, @user.department_id)
    if @warehouse_document.save
      
      puts @warehouse_document.id
      #@warehouse_document = WarehouseDocument.last
      redirect_to warehouse_document_warehouse_details_path(@warehouse_document)
      
    else
      flash[:failure] = "Pranimi nuk mund te behet!"
      render '/warehouse_documents'
    end
  end
  
  def dalje_depo
    
  end 
  
  private
  
    def staf_i_depos
      @user = current_user
      #puts @user.inspect
      redirect_to(root_path) unless @user.department_id == 6 || @user.department_id == 5
    end
    
    def warehouse_document_params
      params.require(:warehouse_document).permit(:supplier_id, :request_id)
    end


end
