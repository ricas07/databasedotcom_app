# Container into which you will materialize the Salesforce objects.
module SFDC_Models
	#
	#
  class User
  	client = Databasedotcom::Client.new("config/databasedotcom.yml")
  	User = client.materialize("User")
  end
end	