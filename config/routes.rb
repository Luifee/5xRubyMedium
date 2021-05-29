Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :api do
    post :upload_image, to: 'utils#upload_image'

    resources :users, only: [] do
      member do
        post :follow
      end
    end

    resources :memos, only: [] do
      member do
        post :clap
	post :clip
      end
    end
  end

  resources :memos do
    resources :comments, only: [:create]
  end

  resources :users, only: [] do
    collection do
      get :pricing
      get :payment
    end
  end

  get '@:username/:memo_id', to: 'pages#show', as: 'memo_page'
  get '@:username', to: 'pages#user', as: 'user_page'
  root 'pages#index'

end
