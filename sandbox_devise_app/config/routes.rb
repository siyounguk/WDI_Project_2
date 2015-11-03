Rails.application.routes.draw do
  devise_for :users

  resources :images do
    member do
      put "like", to: "images#upvote"
    end      
  end

  # match "/images/add_new_comment" => "images#add_new_comment", :as => "add_new_comment_to_images", :via => [:post]
  
  post "/images/:id/add_new_comment", to: "images#add_new_comment"

  root to: "images#index"
end
