class TasksController < ApplicationController
  include Databasedotcom::Rails::Controller

  def new
    @task = Task.new
  end

  def create
    task = Task.new(params[:task])
    task.IsRecurrence = false
    task.IsReminderSet = false
    task.Priority = "Normal"
    user = SFDC_Models::User.first
    task.OwnerId = user.Id
    if (task.save)
      redirect_to(tasks_path, :notice => 'Task was successfully created.')
    end
  end

  def index
    @tasks = Task.all 
  end
end 