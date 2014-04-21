class MessagesController < ApplicationController
	before_action :set_current_user
  before_action :signed_in_user, only: [:new, :index]
  layout "dialog"
  def index
  end
  
  def new
    @task  = Task.new
  end

  def create

    @task  = Task.new(task_params)
    @task.user_id=@current_user.id
    @task.slave_id=666

    @task.status="Open"

    if @task.save
      render :text => "#{@task.save}"
    else
      render 'new'
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
