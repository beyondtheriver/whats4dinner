Rails.application.routes.draw do
  devise_for :users,
             :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

devise_scope :user do
    get '/users/auth/:provider/callback' => 'omniauth_callbacks#test'
end


  delete 'users/:id/delete' => 'users#destroy'

  get 'recipes/individual_recipe/:id' => 'recipes#individual_recipe'

  get '/recipes/show' => 'recipes#show'

  post 'ingredient_search' => 'recipes#show'

  post 'favorite_recipe' => 'recipes#favorite'

  # post 'recipes/indvidual_recipe/:id/favorite' => 'recipes#favorite'


  get '/recipes' => 'recipes#index'

  # get 'static_pages/home'

  # get 'static_pages/contact'

  root 'static_pages#home'

  # put '/favorite_recipe' => 'recipes/individual_recipe'


  resources :profiles
end
