TweetSentiment::Application.routes.draw do
  root :to => 'home#index'  

  match "/analyze" => 'home#analyze', :as => :analyze, :via => :post 
end