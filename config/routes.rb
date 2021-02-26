require "sidekiq/web"
Rails.application.routes.draw do
  root "challenges#index"
  post "challenges/create"
  devise_for :employees
  get "/employees" => "challenges#index"
  resources :challenges do
    member do
      post "upvote"
      delete "downvote"
      post "collaborations"
      delete "collaborationsdelete"
    end
  end

  mount Sidekiq::Web => "/sidekiq"
end
