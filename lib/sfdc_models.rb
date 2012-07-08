# Container into which you will materialize the Salesforce objects.
module SFDC_Models 
	include Databasedotcom::Rails::Controller 

URI = "config/databasedotcom.yml"
client = Databasedotcom::Client.new("config/databasedotcom.yml")
client.materialize("User")
  class User  	
  end

end	