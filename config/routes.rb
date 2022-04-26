Rails.application.routes.draw do
  #root to: 'public/sessions#new'
  root to: 'homes#index'

  devise_for :admin, controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}
  devise_for :customers,controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 scope module: :public do
   
   resources :corporates,only:[:index,:show]
   resources :reports,only:[:new,:create,:show,:edit,:update,:index]
 end
  namespace :admin do
     get '/customers/unsubscribe' => 'admin/customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdrawal' => 'admin/customers#withdrawal', as: 'withdrawal'
    resources :corporates,only:[:new,:create,:show,:edit,:update,:index]
    resources :reports,only:[:show,:index]
    resources :customers
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
