class ApplicationController < ActionController::Base
  require 'will_paginate/array'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # Ket pjese perfundi e kom bo comment kur e kom mar kodin e updateum prej githubit
  
  #def full_title(page_title)
   # base_title = "Intraneti"
    #if page_title.empty?
     # base_title
    #else
     # "#{page_title} | #{base_title}"
    #end
  #end
  
  #def current_user
   # return unless 
      
    #end
  
  #private 
  
    #Confirms a Logged-in user.
   # def logged_in_user
    #  unless logged_in?
     #   store_location
      #  flash[:danger] = "Kycuni ju lutem!"
       # redirect_to login_url
      #end
    #end
end
