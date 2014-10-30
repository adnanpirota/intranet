class StaticPagesController < ApplicationController
  def home
    @leave = current_user.leaves.build if logged_in?
  end

  def help
  end
  
  def about
  end
end
