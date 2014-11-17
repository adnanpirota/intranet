class StaticPagesController < ApplicationController
  def home
    logger.debug "Para se me thir logged_in?"
    if logged_in?
      @user = current_user
      
      logger.debug "Mbasi qe u thir logged_in qe parimisht dmth se kemi login dhe current_user osht: #{current_user.inspect}"
      @leave = current_user.leaves.build
    end
  end

  def help
  end
  
  def about
  end
end
