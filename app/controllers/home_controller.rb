class HomeController < ApplicationController

	def index
		@contexts = Context.all
	end

	def analyze
		redirect_to result_path(params[:search])
	end

	def result
		@contexts = Context.all

		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "BlpfM8bCI4RVELlc5PGhAg"
		  config.consumer_secret     = "IJYJ0ga6CP4sNBZ7pCgCFh73aocPXCTmbIKLYVbomIQ"
		  config.access_token        = "15689757-hspmJBwuytAkFlJzKNUpvCIV0skcQbDyCKvrgTLag"
		  config.access_token_secret = "0lufFh9k1j5mQ2DtJ2PswvGIJrZTQfsbxkau0Gp6U0"
		end

		result_type = params[:result_type] ? params[:result_type].downcase : 'mixed'
		search = params[:search].gsub("@", "to:") ? params[:search] : ''

		@tweets = client.search(search, :count => 50, :result_type => result_type, :lang => "en").collect
	end
	
end
