class TweetOutputOrganizer
	def self.organize_to_show(tweets)
		tweets_array = []
		tweets.each do |tweet|
			tweets_array << {:text => tweet.text, :date => tweet.created_at, :sentiment => nil}
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
end