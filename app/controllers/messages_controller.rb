class MessagesController < ApplicationController
	before_action :set_current_user
  before_action :signed_in_user, only: [:new]

  def new
    render :layout => 'dialog' 
  end

  def create

    @cur_task  = Task.new(task_params)
    @cur_task.user_id=@current_user.id
    @cur_task.slave_id=777

    @cur_task.status="Open"

    if @cur_task.save
      render :text => "Ok"
    else
      render :text => "Error!"
    end

  end

  def share
    @share_url="http://foo.bar/biz"
    render :layout => 'dialog'
  end

  private
  def task_params
    params.require(:task).permit(:description, :cookie, :deadline)
  end
end
