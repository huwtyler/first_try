Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
    # resources :interactions
  end

  resources :users
end

# root - index of tweets of my follows
# /articles/:id - individual view of a tweet plus comment form
# /users/:id - individual's own tweets
# /articles/new - new tweet form