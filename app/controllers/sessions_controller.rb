class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
  	@user=User.find_by_omni(request.env['omniauth.auth'])
  	session[:user_id]=@user.id
  	redirect_to request.env['omniauth.origin'] || tasks_path
  end
  def destroy
  	session.delete (:user_id)
  	redirect_to root_path
  end

end
