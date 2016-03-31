class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    if User.exists?(session[:user_id]) 
      @current_user ||= User.find(session[:user_id]) 
    else
      false
    end
  end

  helper_method :current_user

end

