Rails.application.routes.draw do
  namespace :admin do
    get 'corporates/new'
    get 'corporates/show'
    get 'corporates/index'
    get 'corporates/edit'
  end
  namespace :public do
    get 'corporates/index'
    get 'corporates/show'
  end
  namespace :admin do
    get 'reports/index'
    get 'reports/show'
  end
  namespace :public do
    get 'reports/new'
    get 'reports/show'
    get 'reports/edit'
    get 'reports/index'
  end
  devise_for :admin, controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}
  devise_for :customers,controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
