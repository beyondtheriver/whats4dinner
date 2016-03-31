Rails.application.routes.draw do
  devise_for :users,
             :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

devise_scope :user do
    get '/users/auth/:provider/callback' => 'omniauth_callbacks#test'
end


  match 'users/:id' => 'devise/registrations#destroy', :via => :delete, :as => 'cancel_registration'

  get 'recipes/individual_recipe/:id' => 'recipes#individual_recipe'

  get '/recipes/show' => 'recipes#show'

  post 'ingredient_search' => 'recipes#show'


  get 'recipes/index'

  get 'static_pages/home'

  get 'static_pages/contact'

  root 'static_pages#home'


  resources :profiles
end
