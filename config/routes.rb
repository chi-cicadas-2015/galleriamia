Rails.application.routes.draw do

  resources :users do
    resources :collections do
      resources :pieces do
        resources :tags
      end
    end
    resources :events
  end

  get '/artists' => 'users#index'

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
