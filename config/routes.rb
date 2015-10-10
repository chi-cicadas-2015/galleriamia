Rails.application.routes.draw do

  resources :users do
    resources :collections do
      resources :pieces do
        resources :tags
      end
    end
    resources :events
  end
end
