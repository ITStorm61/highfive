class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user
  	@current_user=User.find_by_id(session[:user_id]) unless session[:user_id].nil?
  end

  def signed_in_user
    if !@current_user
      render :text => 'login plz'
    end
  end
end
