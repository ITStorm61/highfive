class MessagesController < ApplicationController
	before_action :set_current_user
  def new
    render :layout => 'dialog'
  end

  def share    
    render :layout => 'dialog'
  end
end
