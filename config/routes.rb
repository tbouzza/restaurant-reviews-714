Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    # get 'restaurants/top', to: 'restaurants#top'
    collection do
      get :top
    end

    # get 'restaurants/:id/chef', to: 'restaurants#chef'
    member do
      get :chef
    end

    # post 'restaurants/:restaurant_id/reviews', to: 'reviews#create'
    resources :reviews, only: [:create]
  end

  # get 'reviews/:id/edit', to: 'reviews#edit'
  # patch 'reviews/:id'   , to: 'reviews#update'
  # delete 'reviews/:id'. , to: 'reviews#destroy'
  resources :reviews, only: [:edit, :update, :destroy]
end
