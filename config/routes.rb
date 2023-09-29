Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :react, defaults: { format: 'json' } do
    resource :news do
      get :index
      get :search_by_tickers
    end

    resource :tickers do
      get :search
    end
  end
  root "static#index"
end
