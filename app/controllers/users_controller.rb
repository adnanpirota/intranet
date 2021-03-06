class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @departamentet = Department.all
    @user = User.new
  end
  
  
  def show
    @user = User.find(params[:id])  
    @leaves = @user.leaves.paginate(page: params[:page])
     
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Punetori u regjistrua ne sistem"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    
    @user = User.find(params[:id])  
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profili u perditsua"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  
  
  private
  
    def user_params
      params.require(:user).permit(:picture, :emri, :emaili, :password, :password_confirmation, :departamenti_id)  
    end
    
    # Confirms a Logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Duhet te kyceni per ta kryer kete veprim!"
        redirect_to login_url
      end
    end
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
end
