Rails.application.routes.draw do

  resources :users, except: :index do
    resources :collections do
      resources :pieces do
        resources :tags
      end
    end
    resources :events
  end

  get '/artists' => 'artists#index'
  get '/artists/:id' => 'artists#show', as: 'artist'

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "welcome/index"

  root "welcome#index"
end
