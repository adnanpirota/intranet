class ContractCommentsController < ApplicationController
  before_action :kontrata_aktale
  #before_action :shfaqi_komentet, only: [:index, :create]
  respond_to :html, :js
  
  def index
    @contract = Contract.find(params[:contract_id])
    @user = current_user
    #logger.debug "TUNG ... numri i komenteve per ket kontrate osht: #{@contract.contract_comments.first.inspect}"
    @contract_comments = @contract.contract_comments  
  end
  
  def new
    @contract = Contract.find(params[:contract_id])
    #@user = current_user
    @contract_comment = ContractComment.new 
  end
  
  
  def create
    #@contract = Contract.find(params[:contract_id])
    @contract_comment = @contract.contract_comments.build(contract_comment_params)
    @contract_comment.update_attribute(:punetori, current_user.emri)
    
    if @contract_comment.save
      flash[:success] = "Komenti u shtua me sukses"
      @contract_comments = @contract.contract_comments
      #redirect_to :action => :index
      #@komentet = @contract.contract_comments
      
    else
      render 'index'
    end
  end
  
  def update
    #@contract_comment.update_attributes(contract_comment_params)
    @komentet = @contract.contract_comments
  end
  
  
  private
  
    def kontrata_aktale
      @contract = Contract.find(params[:contract_id])
      @user = current_user
    end
    
    def shfaqi_komentet
      @komentet = @contract.contract_comments
    end
  
    def contract_comment_params
      params.require(:contract_comment).permit(:komenti, :ndikues, :punetori)
    end
  
end