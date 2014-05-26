class TasksController < ApplicationController
	before_action :set_current_user
  layout false

  def index
    @notice = ""
    @tasks=Task.where("user_id=? or slave_id=?",@current_user.id, @current_user.id).includes(:user).order("updated_at DESC").page(params[:page]).per(5)
    if @tasks.count==0
      @notice = "У вас нет еще ни одного задания!"
    end
    render layout: 'main'
  end

  def new
    @task  = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id=@current_user.id
    @task.status="new"
    if @task.save
      render js: "window.location='#{root_path}';"
    else
      render json: @task.errors, status: :unprocessable_entity
    end

  end

  def show
    @task = Task.find_by_token(params[:token])
  end

  def share
    @task = Task.find_by_token(params[:task_token])
  end

  def destroy
    @task = Task.find_by(token: params[:token])
    @task.destroy
    redirect_to tasks_path
  end

  def update_status
    @task = Task.find_by(token: params[:task_token])
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
            # FriendsController.inc_exp(@task.user_id, @task.slave_id)
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
    params.require(:task).permit(:description, :cookie)
  end


end
