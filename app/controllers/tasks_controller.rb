class TasksController < ApplicationController
  before_action :set_current_user, :except => [:show]
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

  def destroy
    @task = Task.find_by(token: params[:token])
    @task.destroy
    redirect_to tasks_path
  end

  def show
    @current_user=User.find_by_id(session[:user_id]) unless session[:user_id].nil?
    @task = Task.find_by_token(params[:token])
    if @current_user.blank?
      render "show_with_login", layout: "index"
    elsif !request.xhr?
      redirect_to root_path + '#' + task_path(params[:token])
    end
  end

  # Кто-то хочет взять задание
  def take
    @task = Task.find_by(token: params[:task_token])
    if @task.slave_id.nil?
      @task.slave_id = @current_user.id
      @task.status = "in_process"
      @task.save
    end
    render js: "window.dialogLoad('#{task_path(@task.token)}');"
  end

  # refuse отказаться от выполнения
  def refuse
    @task = Task.find_by(token: params[:task_token])
    render js: "window.location='#{root_path}';"
  end

  def cancel  # Отменить взятое задание
    @task = Task.find_by(token: params[:task_token])
    if @task.isOwner?(@current_user)
      @task.status = "canceled"
      @task.save
    elsif @task.isSlave?(@current_user)
      @task.slave_id = nil
      @task.status = "new"
      @task.save
    end
    render js: "window.dialogLoad('#{task_path(@task.token)}');"
  end

  def done # Кто-то выполнил задание
    @task = Task.find_by(token: params[:task_token])
    if @task.isSlave?(@current_user)
      @task.status = "ready"
      @task.save
    end
    render js: "window.dialogLoad('#{task_path(@task.token)}');"
  end

  def finish # Отдал награду
    @task = Task.find_by(token: params[:task_token])
    if @task.isOwner?(@current_user)
      @task.status = "done"
      @task.save
    end
    render js: "window.dialogLoad('#{task_path(@task.token)}');"
  end

private
  def task_params
    params.require(:task).permit(:description, :cookie)
  end

  def set_task
    @task = Task.find_by(token: params[:task_token])
  end
end
