class WarehouseDocumentsController < ApplicationController
  
  before_action :staf_i_depos
  respond_to :html, :js
  
  def index
    
    #@warehouse_documents = WarehouseDocument.pranim
  
  end
  
  def show
    @warehouse_document = WarehouseDocument.find(params[:id])
    if @warehouse_document.pranimdalje == false
      
      render 'showhyrje'
    else
      
      render 'showdalje'
    end
  end
  
  def new
    @warehouse_document = WarehouseDocument.new
    
  end
  
  def newd
    @warehouse_document = WarehouseDocument.new
  end
  
  
  
  def pranim_malli
    @warehouse_documents = WarehouseDocument.pranim_desc
    @warehouse_document = WarehouseDocument.new
    
    
  end
  
  def dalje
    @warehouse_documents = WarehouseDocument.dalje
    @warehouse_document = WarehouseDocument.new
    
      
    #render 'newd.js.erb'
  end
  
  def create
    @warehouse_document = WarehouseDocument.new(warehouse_document_params)
    @warehouse_document.update_attribute(:depo, @user.department_id)
    @warehouse_document.update_attribute(:dataora, Time.now)
    @warehouse_document.update_attribute(:pranimdalje, false)
    if @warehouse_document.save
      
      puts @warehouse_document.id
      #@warehouse_document = WarehouseDocument.last
      redirect_to warehouse_document_warehouse_details_path(@warehouse_document)
      
    else
      flash[:failure] = "Pranimi nuk mund te behet!"
      render '/warehouse_documents'
    end
  end
  
  def create_dalje
    @warehouse_document = WarehouseDocument.new(warehouse_document_params)
    @warehouse_document.update_attribute(:depo, @user.department_id)
    @warehouse_document.update_attribute(:pranimdalje, true)
    @warehouse_document.update_attribute(:dataora, Time.now)
    if @warehouse_document.save
      
      redirect_to details_dalje_path(@warehouse_document)
      
    else
      flash[:failure] = "Dalja nuk mund te behet"
      render '/warehouse_documents'
    end
    
  end
  
  def artikujt_per_kartele
    @lista_artikujve = Item.tenjesis(@user.department_id).kerkimi_per_kartele(params[:search])
  end
  
  def kartela_artikullit
    puts "te kartela_artikullit ne warehouse_documents_controller"
    @kartela = WarehouseDetail.kartela(params[:item_id])
    puts @kartela.inspect
  end
   
  
  private
  
    def staf_i_depos
      @user = current_user
      #puts @user.inspect
      redirect_to(root_path) unless @user.department_id == 2 || @user.department_id == 3 || @user.admin == true
    end
    
    def warehouse_document_params
      params.require(:warehouse_document).permit(:supplier_id, :request_id, :user_id, :shenim, :department_id)
    end


end
