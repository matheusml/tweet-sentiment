require 'java'
require 'lib/SentimentClassifier2.jar'
java_import 'SentimentClassifier2';

class OpinionClassifier 
	def self.classify
		classifier = SentimentClassifier2.new
		classifier.makeClassification("ModeloSVM2.model", "tweets.txt", "opinionfact.txt");
	end
end