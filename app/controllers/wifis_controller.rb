class WifisController < ApplicationController
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
end