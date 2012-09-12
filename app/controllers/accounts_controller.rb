class AccountsController < ApplicationController
  include Databasedotcom::Rails::Controller
  before_filter :signed_in_user

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
    @accounts = Account.all()[0..4].sort{ |a,b| a.LastModifiedDate <=> b.LastModifiedDate }.reverse
    
    #This is a horrible way to hack the search bar. Looks like it can't issue a blank request, so I have to set the :Name param to something on the initial load. Once it load any other name or id can be entered. This shouldn't be so difficult, I just can't waste the time on it right now. 
    @name_hack = Account.first.Name
    if params[:Name] == nil and params[:Id] == nil
      params[:Name] = @name_hack
      @account = Account.find_by_Name(params[:Name])
    end
    #end hack

    if params[:Name] != nil
      @account = Account.find_by_Name(params[:Name])
    end

    if params[:Id] != nil
      @account = Account.find(params[:Id])
    end

    #@account = Account.find(params[:Id])
    #@account = Account.find_by_Name(params[:Name])
  end

  def show  
    @account = Account.find(params[:id]) 
    @marketing_strategy = Marketing_Strategy__c.find_by_Account__c("#{@account.Id}")
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

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

end 