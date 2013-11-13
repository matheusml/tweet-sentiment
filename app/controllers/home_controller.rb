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

		@tweets = client.search(search, :count => 1, :result_type => result_type, :lang => "en").collect

		@chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Browser share',
               :data=> [
                  ['Positive',  45.0],
                  ['Negative',  35.0],
                  ['Neutral',   20.0],
               ]
      }
      f.series(series)
      f.options[:title][:text] = "Pie Chart"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
end
	end
	
end
