class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(emaili: params[:session][:emaili].downcase)
    logger.debug "TUNG nga metoda create e SessionsController ... #{user.inspect}"
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else 
      flash.now[:danger] = 'Emaili dhe fjalekalimi nuk perputhen' 
      render 'new'  
    end
  end
  
  def destroy
    logger.debug "TUNG nga metoda destroy e SessionsController ..."
    log_out if logged_in?
    redirect_to root_url
  end
  
end
