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

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
	    f.title({ :text=>"Tweets chart"})
	    f.options[:xAxis][:categories] = ['Brazil', 'Spain', 'Germany', 'Italy', 'Portugal']
	    f.labels(:items=>[:html=>"Sentiment", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
	    f.series(:type=> 'column',:name=> 'Good',:data=> [3, 2, 1, 3, 4])
	    f.series(:type=> 'column',:name=> 'Medium',:data=> [2, 3, 5, 7, 6])
	    f.series(:type=> 'column', :name=> 'Bad',:data=> [4, 3, 3, 9, 0])
	    f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
	    f.series(:type=> 'pie',:name=> 'Total consumption', 
	      :data=> [
	        {:name=> 'Good', :y=> 13, :color=> 'red'}, 
	        {:name=> 'Medium', :y=> 23,:color=> 'green'},
	        {:name=> 'Bad', :y=> 19,:color=> 'blue'}
	      ],
	      :center=> [100, 80], :size=> 100, :showInLegend=> false)
	  end
	end
	
end
