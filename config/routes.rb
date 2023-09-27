Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :react, defaults: { format: 'json' } do
    resources :news
  end
end
