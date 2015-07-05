Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }, skip: [:sessions, :registrations]

  resources :ideas, param: :title

  as :user do
    get '/login' => 'devise/sessions#new', as: :new_user_session
    post '/login' => 'devise/sessions#create', as: :user_session
    delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session

    get '/users/cancel' => 'devise/registrations#cancel', as: :cancel_user_registration
    post '/users' => 'devise/registrations#create', as: :user_registration
    get '/signup' => 'devise/registrations#new', as: :new_user_registration
    get '/users/edit' => 'devise/registrations#edit', as: :edit_user_registration
    match '/users' => 'devise/registrations#update', via: [:patch, :put]
  end

  # match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
end
