class TweetOutputOrganizer
	def self.organize_to_show(tweets)
		tweets_array = []
		tweets.each do |tweet|
			tweets_array << {:text => tweet[:text], :date => tweet[:date], :sentiment => nil}
		end

		index = 0

		positive_negative_file = File.new("positivenegative.txt","r")
		positive_negative_file.each do |line|
			tweet_hash = tweets_array[index]
			if tweet_hash.present?
				tweet_hash[:sentiment] = (line.strip == 'POSITIVO' ? 'Positive' : 'Negative')
			end

			index = index + 1
		end

		tweets_array
	end

	def self.organize_opinion_tweets_to_show(tweets)
		tweets_array = []
		tweets_list  = []

		tweets.each do |tweet|
			tweets_list << {:text => tweet.text, :date => tweet.created_at}
		end

		index = 0

		opinion_file = File.new("opinionfact.txt","r")
		opinion_file.each do |line|
			if tweets_list[index].present? && line.strip == 'subjetiva'
				tweets_array << tweets_list[index]
			end

			index = index + 1
		end

		tweets_array
	end

end