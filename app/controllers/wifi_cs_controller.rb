class WifiCsController < ApplicationController
  include Databasedotcom::Rails::Controller
    
   def index
     @wifis = Wifi__c.all()[0..19]
   end

   def show
     @wifi = Wifi__c.find(params[:id])
   end

   def new
     @wifi = Wifi__c.new
   end

   def create
    wifi__c = Wifi__c.new(params[:wifi__c])
    user = SFDC_Models::User.first
    wifi__c.OwnerId = user.Id
    #wifi__c.RecordTypeId = "012E0000000Q0WVIA0"
    #wifi__c.RecordType = "Account"
    if (wifi__c.save)
      redirect_to(wifi__cs_path, :notice => "Wifi '#{@wifi.Name}' was successfully created.")
    end
  end  

   def edit
     @wifi = Wifi__c.find(params[:id])
   end

   def update
    @wifi = Wifi__c.find(params[:id])
    @wifi.update_attributes(params[:wifi__c])
    redirect_to(wifi__cs_path, :notice => "wifi '#{@wifi.Name}' was successfully updated.")
  end
end 