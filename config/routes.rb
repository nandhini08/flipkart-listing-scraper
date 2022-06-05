Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :flipkart_listings, only: [:index]
      post 'scrape_data', to: 'flipkart_listings#scrape_data'
    end
  end
end
