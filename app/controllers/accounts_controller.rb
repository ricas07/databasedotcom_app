class AccountsController < ApplicationController
  include Databasedotcom::Rails::Controller

  def new
    @account = Account.new
  end

  def create
    account = Account.new(params[:account])
    #account.IsRecurrence = false
    #account.IsReminderSet = false
    #account.Priority = "Normal"
    user = SFDC_Models::User.first
    account.OwnerId = user.Id
    account.RecordTypeId = "012E0000000Q0WVIA0"
    account.RecordType = "Account"
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
    redirect_to(accounts_path, :notice => "Account '#{@account.Name}' was successfully updated.")
  end

  def destroy
    account = Account.find(params[:Id])
    account.delete
    redirect_to(accounts_path, :notice => "Account '#{account.Name}' was successfully deleted.")
  end

end 