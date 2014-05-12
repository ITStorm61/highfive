class TasksController < ApplicationController
	before_action :set_current_user
  

  def index
    @notice = "" 
    @tasks=Task.where("user_id=? or slave_id=?",@current_user.id, @current_user.id).includes(:user).order("updated_at DESC")
    if @tasks.count==0
      @notice = "Empty task list!"
    end
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
    @task.status="new"

    if @task.save
      render 'show', :layout =>"dialog"
    else
      render 'new', :layout =>"dialog"
    end

  end

  def share
    @task = Task.find(params[:task_id])
    render :layout =>"dialog"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def update_status 
    @task = Task.find(params[:task_id])
    if @task.user_id==@current_user.id 
      # my task
      case @task.status
        when "in_progress"
          if params[:status]=="1"
            @task.status = "canceled"
            @task.save
          end
        end
    else
      # other task
      case @task.status
      when "new"
        if params[:status]=="0"
          @task.slave_id = @current_user.id
          
          @task.status = "in_progress"
          @task.save
        end
      when "in_progress"
          if params[:status]=="0"
            @task.status = "done"
            @task.save
            FriendsController.inc_exp(@task.user_id, @task.slave_id)
          elsif params[:status]=="1"
            @task.status = "canceled"
            @task.save
          end
      end
    end
    redirect_to task_path(@task)
  end

  private
  def task_params
    params.require(:task).permit(:description, :cookie, :deadline)
  end
end
