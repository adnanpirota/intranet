class ContractsController < ApplicationController
  before_action :staf_i_prokutimit
  respond_to :html, :js
  
  def index
    #logger.debug "Para se me thir userin ne metoden index te contracts_controller"
    @user = current_user
    #logger.debug "Ne metoden index te ContractsController @user osht: #{@user.inspect}"
    @contracts = Contract.all
  end
  
  def show
    @contract = Contract.find(params[:id])
     @user = current_user
     #@komentet = @contract.contract_comment
  end

  def new
    @user = current_user
    @contract = Contract.new
  end
  
  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      flash[:success] = "Kontrata u regjistrua ne sistem"
      #redirect_to @contract
      @contracts = Contract.all
    else
      render 'index'
    end
  end

  def edit
  end
  
  private 
  
    def contract_params
      params.require(:contract).permit(:numri_kontrates, :supplier_id, :item_id, :sasia, :avansi, :cmimi, :pjesa_mbetur_per_pagese, :koha_arritjes_port, :koha_reale_arritjes_port, :departamenti) 
    end
    
    def staf_i_prokutimit
      @user = current_user
      puts @user.inspect
      redirect_to(root_path) unless @user.departamenti_id == 2
    end
end
 