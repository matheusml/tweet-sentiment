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

		result_type = params[:result_type] ? params[:result_type].downcase : 'mixed'
		search = params[:search].gsub("@", "to:") ? params[:search] : ''
		
		tweets = client.search(search, :count => 20, :result_type => result_type, :lang => "en").collect
		
		TweetHandling.generate_file(tweets, 'tweets.txt')
		OpinionClassifier.classify
		opinion_tweets_only = TweetOutputOrganizer.organize_opinion_tweets_to_show(tweets)

		TweetHandling.generate_opinion_file(opinion_tweets_only, 'opinion.txt')
		SentimentClassifier.classify
		@tweets = TweetOutputOrganizer.organize_to_show(opinion_tweets_only)

		@chart = build_chart(@tweets)
	end

	private 

	def build_chart(tweets)
		positive_count = 0
		negative_count = 0
		tweets.each do |tweet|
			if tweet[:sentiment] == 'Positive'
				positive_count += 1
			else
				negative_count += 1
			end
		end

		LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Browser share',
               :data=> [
                  ['Positive',  positive_count],
                  ['Negative',  negative_count],
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
