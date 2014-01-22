require 'java'
require 'lib/classificador.jar'
java_import 'SentimentClassifier';

class Classifier 
	def self.classify
		classifier = SentimentClassifier.new
		classifier.makeClassification("SVMModel.model", "tweets.txt", "arquivo.txt");
	end
end