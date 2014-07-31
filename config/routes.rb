Feeder::Application.routes.draw do

  root 'movies#index'

  scope "public", modlue: 'public' do
    resources :movies, only: [:index]
  end

  resources :movies, only: [:index] do
    collection do
      post "import"
    end
  end


  resources :sessions, only: [:new, :create]
  get :logout, to: "sessions#destroy"
  post :login, to: "sessions#create"
  get :login, to: "sessions#new"


end
