Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
  end

  resources :users do
    resources :followers
  end

  post 'users/follow', to: 'users#follow'
  post 'users/unfollow', to: 'users#unfollow'

  post 'article/interaction', to: 'interactions#create'
end

# root - index of tweets of my follows
# /articles/:id - individual view of a tweet plus comment form
# /users/:id - individual's own tweets
# /articles/new - new tweet form
# /users/:id/followers - the user's followers
# /users/:id/followees -  the user's followees