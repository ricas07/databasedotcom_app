class Salesforce::OpportunitiesController < ApplicationController
  include Databasedotcom::Rails::Controller
  before_filter :signed_in_user

  def new
      @opportunity = Opportunity.new
      @opportunity.AccountId = (params[:AccountId])
  end

  def create
    opportunity = Opportunity.new(params[:opportunity])
    #opportunity.IsRecurrence = false
    #opportunity.IsReminderSet = false
    #opportunity.Priority = "Normal"
    user = SFDC_Models::User.first
    opportunity.OwnerId = user.Id
    #opportunity.StageName = "Prospecting"
    opportunity.IsPrivate = false
    opportunity.CloseDate = Time.now + 30
    # opportunity.RecordTypeId = "012E0000000Q0WVIA0"
    if (opportunity.save)
      redirect_to(opportunities_path, :notice => 'Opportunity was successfully created.')
    end
  end 

  def index
    @opportunities = Opportunity.all
    opportunity = Opportunity.find(params[:id])
    @opportunity_owner = SFDC_Models::User.find_by_id("#{opportunity.OwnerId}")
  end

  def show  
    @opportunity = Opportunity.find(params[:id]) 
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
  end

  def update
    @opportunity = Opportunity.find(params[:id])
    @opportunity.update_attributes(params[:opportunity])
    redirect_to(opportunities_path, :notice => "Opportunity '#{@opportunity.Name}' was successfully updated.")
  end

  def destroy
    opportunity = Opportunity.find(params[:Id])
    opportunity.delete
    redirect_to(opportunities_path, :notice => "Opportunity '#{opportunity.Name}' was successfully deleted.")
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

end 