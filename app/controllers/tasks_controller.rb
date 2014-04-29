class TasksController < ApplicationController
	before_action :set_current_user
  

  def index
    @tasks=Task.where("user_id=? or slave_id=?",@current_user.id, @current_user.id).includes(:user)
  end

  def show
    @task = Task.find(params[:id])
    render :layout =>"dialog"
  end
  
  def new
    @task  = Task.new
    render :layout =>"dialog"
  end

  def create

    @task  = Task.new(task_params)
    @task.user_id=@current_user.id
    @task.slave_id=666

    @task.status="Open"

    if @task.save
      render 'share', :layout =>"dialog"
    else
      render 'new', :layout =>"dialog"
    end

  end

 # def share
 #   render :layout =>"dialog"
 # end



  private
  def task_params
    params.require(:task).permit(:description, :cookie, :deadline)
  end
end
