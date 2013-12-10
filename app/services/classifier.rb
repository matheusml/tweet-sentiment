require 'java'
require 'lib/classificador.jar'
java_import 'SentimentClassifier';

class Classifier 
	def self.classify
		classifier = SentimentClassifier.new

		String model = "SVMModel.model";
		String tweets = "tweets";
		
		classifier.makeClassification(model, tweets);
	end
end