Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '/auth', to: 'user_token#create', via: [:post]
  match 'addresses/:cep', to: 'addresses#get_address',      via: [:get]
end
