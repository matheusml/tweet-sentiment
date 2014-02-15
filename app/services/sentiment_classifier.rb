require 'java'
require 'lib/classifierSentiment.jar'
java_import 'SentimentClassifier';

class SentimentClassifier 
	def self.classify
		classifier = SentimentClassifier.new
		classifier.makeClassification("SVMModel.model", "opinion.txt", "positivenegative.txt");
	end
end