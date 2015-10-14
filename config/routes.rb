Rails.application.routes.draw do

  resources :users do
    member do
      get "/artist_details" => "profiles#new"
      post "/artist_details" => "profiles#create"
    end
    resources :collections do
      resources :pieces do
        resources :tags
      end
    end
  end

  resources :events, except: :show
  get '/events/search' => 'events#search', as: "events_search"

  get '/artists' => 'users#index'

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get '/artists/random' => 'users#random_artist'

  get "welcome/index"

  get '/search' => 'welcome#search'

  root "welcome#index"
end
