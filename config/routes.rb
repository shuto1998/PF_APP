Rails.application.routes.draw do
  namespace :public do
    get 'events/index'
  end
  root to: 'homes#top'

  devise_for :admin, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions'
  }
  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  scope module: :public do
    resources :corporates, only: %i[index show] do
      get :search, on: :collection
    end
    resources :reports do
      get :search, on: :collection
      resource :favorites, only: %i[create destroy]
      resources :comments, only: %i[create destroy]
    end
    resources :events
  end
  namespace :admin do
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdrawal/:id' => 'customers#withdrawal', as: 'withdrawal'
    resources :corporates, only: %i[new create show edit update index destroy] do
        get :search, on: :collection
    end
    resources :reports, only: %i[show index]
    resources :customers do
      get :search, on: :collection
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
