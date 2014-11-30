module SessionsHelper
  
  #Logs in the given user.
  def log_in(user)
    #remember_token = User.new_remember_token
   # cookies.permanent[:remember_token] = remember_token
   # user.update_attribute(:remember_token, User.digest(remember_token))
    # qet resht perfundi e kom hek kur e kom riprogramu sesionin tu u bazu ne kodin ne git
    session[:user_id] = user.id
    session[:departamenti_id] = user.departamenti_id
   # self.current_user = user
  end
  
  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end
  
  # Returns the current Logged-in user (if any).
  #def current_user
   # if (user_id = session[:user_id])
    #  @current_user ||= User.find_by(id: user_id)
    #elsif ( user_id = cookies.signed[:user_id])
     # user = User.find_by(id: user_id)
      #if user && user.authenticated?(cookies[:remember_token])
       # log_in user
        #@current_user = user
      #end
    #end
  #end
  
  def current_user=(user)
    @current_user = user
    #logger.debug "Useri qe paraqitet ne current_user=(user) osht: #{@current_user.inspect}"
  end
  
  def current_user
    #logger.debug "Mrenda current_user po para se me mar remember_token prej modelit te userit"
    remember_token = User.digest(cookies[:remember_token])
    #logger.debug "remember_tokeni qe u konvertu prej digestit te nxjerr prej cookiet osht: #{remember_token.to_s} "
    @current_user ||= User.find_by(id: session[:user_id])
    #@current_user ||= User.find(14)
    #logger.debug "Useri qe po qitet ne current_user osht: #{@current_user.inspect}"
  end
  
  
  
  
  # Returns ture if the user is Logged in, false otherwise
  def logged_in?
    #logger.debug "Mrenda logged_in? current_user osht #{current_user.inspect }"
    !current_user.nil?  
  end
  
  # Logs out the current user
  def log_out
    #logger.debug "TUNG nga metoda log_out ... "
    current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
    # rreshtat ma posht i kom komentu kur e kom mar kodin prej githubit
    forget(current_user)
    session.delete(:user_id)
    session.delete(:departamenti_id)
    @current_user = nil
  end
  
  # Forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  #kodin posht e kom mar prej kodit ne github
  def loged_in_user
    unless logged_in?
    store_location
    redirect_to signin_url, notice: "Ju lutemi te kyceni!"
    end
  end
end
