class HomeController < ApplicationController
	before_action :redirect_to_tasks
  def index
  end
  private
  def redirect_to_tasks
  	 redirect_to tasks_path if session[:user_id] and User.find_by_id(session[:user_id])
  end 
end
