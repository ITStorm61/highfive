class HomeController < ApplicationController
	before_action :set_current_user
  def index
  	render :layout => 'index'
  end
end
