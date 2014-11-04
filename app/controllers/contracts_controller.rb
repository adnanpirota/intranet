class ContractsController < ApplicationController
  def index
    @user = current_user
    @contracts = Contract.all
  end
  
  def show
    @contract = Contract.find(params[:id])
     @user = current_user
  end

  def new
  end

  def edit
  end
end
 