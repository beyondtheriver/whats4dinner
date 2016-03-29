Rails.application.routes.draw do
  devise_for :users,
             :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

devise_scope :user do
    get '/users/auth/:provider/callback' => 'omniauth_callbacks#test'
end

  get 'static_pages/home'

  get 'static_pages/contact'

  root 'static_pages#home'
end
