class AccountsController < ApplicationController
  include Databasedotcom::Rails::Controller

  def new
    @account = Account.new
  end

  def create
    account = Account.new(params[:Account])
    #Account.IsRecurrence = false
    #Account.IsReminderSet = false
    #Account.Priority = "Normal"
    #user = SFDC_Models::User.first
    #Account.OwnerId = user.Id
    if (account.save)
      redirect_to(accounts_path, :notice => 'Account was successfully created.')
    end
  end

  def index
    @accounts = Account.all 
  end

  def show  
    @account = Account.find(params[:id]) 
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    @account.update_attributes(params[:account])
    redirect_to(Accounts_path, :notice => "Account '#{@account.Subject}' was successfully updated.")
  end

  def destroy
    account = Account.find(params[:Id])
    account.delete
    redirect_to(accounts_path, :notice => "Account '#{account.Subject}' was successfully deleted.")
  end

end 