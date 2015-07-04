Rails.application.routes.draw do
  root 'pages#home'

  scope 'idea' do
    get     'new',      to: 'idea#new',     as: :new_idea
    post    'create',   to: 'idea#create',  as: :create_idea

    scope ':title' do
      patch   'update',   to: 'idea#update',  as: :update_idea
      delete  'delete',   to: 'idea#delete',  as: :delete_idea
    end
  end
end
