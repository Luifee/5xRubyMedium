Rails.application.routes.draw do

  resources :memos do
    resources :comments, only: [:create]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'pages#index'
  get '@:username/:memo_id', to: 'pages#show', as: 'memo_page'
  get '@:username', to: 'pages#user', as: 'user_page'

end
