class LeavesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def new
    @leave = current_user.leaves.build if logged_in?
  end
  
  def index
    if logged_in?
      #@leaves = current_user.leaves.build
      @leaves = Leave.all.paginate(page: params[:page])
      
      @leaves.each do |l|
        logger.debug "#{l.inspect}"
      end
      
      #@feed_items = current_user.feed.paginate(page: params[:page])
      #@feed_items.each do |fi|
       # logger.debug "#{fi.inspect}"
      #end
    end
  end
  
  def create
    @leave = current_user.leaves.build(leaves_params)
    if @leave.save
      flash[:success] = "Pushimi u krijua ne sistem!"
      redirect_to leaves_path
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    
  end
  
  private 
  
    def leaves_params
      params.require(:leave).permit( :user_id, :arsyetimi, :dita_pare, :dalja_ne_pune)
    end
  
end
