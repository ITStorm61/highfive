class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user
  	return redirect_to root_path if session[:user_id].blank? 
    @current_user=User.find_by_id(session[:user_id]) unless session[:user_id].nil?
    return redirect_to root_path unless @current_user 
  end


end
