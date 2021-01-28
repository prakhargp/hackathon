Rails.application.routes.draw do
  resources :challenge do 
    member do
      post 'upvote'
      post 'downvote'
      post 'collaborations'
    end
  end

  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'challenge#index'
  post 'challenge/create' 
end
