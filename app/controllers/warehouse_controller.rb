class WarehouseController < ApplicationController
  before_action :staf_i_depos
  
  def index
  end
  
  
  private
  
    def staf_i_depos
      @user = current_user
      puts @user.inspect
      redirect_to(root_path) unless @user.department_id == 5 || @user.department_id == 6  
    end
    
end
