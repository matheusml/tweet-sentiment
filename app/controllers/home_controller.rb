class HomeController < ApplicationController

	def index
	end

	def analyze
		puts "-- #{params}"
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "BlpfM8bCI4RVELlc5PGhAg"
		  config.consumer_secret     = "IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ"
		  config.access_token        = "15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag"
		  config.access_token_secret = "0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0"
		end
	end
	
end
