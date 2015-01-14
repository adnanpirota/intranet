class StaticPagesController < ApplicationController
  #before_action :user_i_kycur
  
  def home
    logger.debug "Para se me thir logged_in?"
    if logged_in?
      puts "mrenda logged_in? pra useri duhet me kon loggedin"
      
      @user = current_user
      
      redirect_to(help_path) unless @user.department_id == 2 || @user.department_id == 3
      #logger.debug "Mbasi qe u thir logged_in qe parimisht dmth se kemi login dhe current_user osht: #{current_user.inspect}"
      #@leave = current_user.leaves.build
    end
  end

  def help
  end
  
  def about
  end
  
  private
  
    def user_i_kycur
      @user = current_user
      puts @user.inspect
      redirect_to(help_path) unless @user.department_id == 2 || @user.department_id == 3 || @user.admin == true
    end
end
