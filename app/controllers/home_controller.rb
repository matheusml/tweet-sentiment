class HomeController < ApplicationController

	def index
	end

	def analyze
		redirect_to result_path(params[:search])
	end

	def result
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "BlpfM8bCI4RVELlc5PGhAg"
		  config.consumer_secret     = "IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ"
		  config.access_token        = "15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag"
		  config.access_token_secret = "0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0"
		end

		#first_tweet = client.user_timeline(params[:search]).first

		#puts "---- #{client.methods}"

		@tweets = client.search("to:#{params[:search]}", :count => 50, :result_type => "recent").collect
	end
	
end
