class WarehouseDetailsController < ApplicationController
  before_action :staf_i_depos, :fatura_ose_pranimi_aktual
  respond_to :html, :js
  
  
  def index
    @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
    @user = current_user
    #logger.debug "TUNG ... numri i komenteve per ket kontrate osht: #{@contract.contract_comments.first.inspect}"
    
    if @warehouse_document.pranimdalje == false  
      puts "dokumenti osht pranim"
      @warehouse_details = @warehouse_document.warehouse_details
    else
      puts "dokumenti osht dalje"
      @warehouse_details = @warehouse_document.warehouse_details
      render 'warehouse_details/daljedet'
      
    end
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
    #puts "jom ne veq-create"
    @warehouse_detail = @warehouse_document.warehouse_details.build(warehouse_details_params)
    @warehouse_detail.update_attribute(:pranimdalje, false)
    if @warehouse_detail.cmimi.nil?
      @warehouse_detail.update_attribute(:cmimi, 0)
    end
    
    
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
    @warehouse_detail.update_attribute(:sasia, -@warehouse_detail.sasia)
    puts @warehouse_detail.sasia
    
    
    if @warehouse_detail.save
      
      flash[:success] = "Artikulli i shtua"
      
      @warehouse_details = @warehouse_document.warehouse_details
      
    else
      flash[:failure] = "Gabim!!!"
      render 'index'
    end
    
  end
  
  def artikujt_per_kartele
    #puts params[:search]
    if params[:search]
      @lista_artikujve = Item.tenjesis(@user.department_id).kerkimi_per_kartele(params[:search])
    else
      @lista_artikujve = Item.tenjesis(@user.department_id).order("id DESC").limit(10)
    end
  end
  
  def kartela_artikullit
    puts "jom ne kartela_artikullit ne warehouse_detail"
    @kartela = WarehouseDetail.kartela(params[:id])
  end

  
  def show
  end
  
  def anulo_furnizimin
    @warehouse_document.destroy
    redirect_to items_path
  end
  
  
  
   private
   
    def fatura_ose_pranimi_aktual
      if params[:warehouse_document_id] 
        @warehouse_document = WarehouseDocument.find(params[:warehouse_document_id])
      else
        
      end
    end
  
    def staf_i_depos
      @user = current_user
      #puts @user.inspect
      redirect_to(root_path) unless @user.department_id == 2 || @user.department_id == 3 || @user.department_id == 6 || @user.admin == true
    end
    
    def warehouse_details_params
      params.require(:warehouse_detail).permit(:item_id, :sasia, :cmimi)
    end
    
    
end
