Rails.application.routes.draw do

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
    resources :corporates,only:[:new,:create,:show,:edit,:update,:index]
    resources :reports,only:[:shoe,:index]
    resources :customers
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
