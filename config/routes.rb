Rails.application.routes.draw do
  get 'idea/new'

  get 'idea/create'

  get 'idea/update'

  get 'idea/destroy'

  root 'pages#home'
end
