# Container into which you will materialize the Salesforce objects.
module SFDC_Models 

    client = Databasedotcom::Client.new :client_id => "3MVG9y6x0357Hledlw0Op2Vcbey_xXD3gqwk.D9ApXFeNioQCOda082RjQegBOrMyJ4CispsJoJyDAFbc6dIR", :client_secret => "5587993940227999074"
    client.authenticate :username => "ricas071340318457207@gmail.com", :password => "P@ssword1fgBfS3P0N5B97VQf2SfiW2Q8M"

	client.sobject_module = "SFDC_Models"
    client.materialize("User")
end	