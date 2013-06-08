Hackertracker::Application.routes.draw do
  resources :areas


  resources :unique_items do
    collection do
      post 'search'
    end
    resources :contacts
    resources :caveats
    resources :tutorials
    resources :tickets
    resources :logs
  end

  resources :settings

  resources :payments

  devise_for :users

  resources :users, :path => :members

  root to: 'pages#landing'
end
