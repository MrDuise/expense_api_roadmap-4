Rails.application.routes.draw do
  resources :expenses
  post 'signup', to: 'sessions#signup'
  post 'login', to: 'sessions#create'
end
