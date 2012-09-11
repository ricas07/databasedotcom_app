class MarketingStrategyCsController < ApplicationController
  include Databasedotcom::Rails::Controller
  before_filter :signed_in_user, except: [:new, :create, :edit, :update]
    
    def index
      @marketing_strategys = Marketing_Strategy__c.all()[0..9]
    end

    def show
      @marketing_strategy = Marketing_Strategy__c.find(params[:id])
    end

    def new
      @marketing_strategy = Marketing_Strategy__c.new
      @marketing_strategy.Account__c = (params[:AccountId])
    end

    def create
      marketing_strategy__c = Marketing_Strategy__c.new(params[:marketing_strategy__c])
      user = SFDC_Models::User.first
      marketing_strategy__c.OwnerId = user.Id
        if (marketing_strategy__c.save)
          redirect_to( root_path, :notice => "Marketing Strategy was successfully created.")
        end
    end  

    def edit
      @marketing_strategy = Marketing_Strategy__c.find(params[:id])
    end

    def update
      @marketing_strategy = Marketing_Strategy__c.find(params[:id])
      @marketing_strategy.update_attributes(params[:marketing_strategy__c])
      redirect_to(marketing_strategy__cs_path, :notice => "Marketing Strategy '#{@marketing_strategy.Name}' was successfully updated.")
    end

    def destroy
      marketing_strategy__c = Task.find(params[:Id])
      marketing_strategy__c.delete
      redirect_to(marketing_strategy__cs_path, :notice => "Marketing Strategy '#{marketing_strategy__c.Subject}' was successfully deleted.")
    end

    private

      def signed_in_user
        unless signed_in?
          store_location
          redirect_to signin_path, notice: "Please sign in."
        end
      end
end 