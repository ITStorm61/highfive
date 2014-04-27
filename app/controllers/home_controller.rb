class HomeController < ApplicationController
	before_action :redirect_to_tasks
  def index
  	render :layout => 'index'
  end
  private
  def redirect_to_tasks
  	 redirect_to tasks_path if session[:user_id]
  end 
end
