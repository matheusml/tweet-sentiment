TweetSentiment::Application.routes.draw do
  root :to => 'home#index'  

  match "/analyze" => 'home#analyze', :as => :analyze, :via => :post 
  match "/result/:search" => 'home#result', :as => :result, :via => :get 
  match "/get_tweets" => 'home#get_tweets', :as => :get_tweets, :via => :get 
end