Rails.application.routes.draw do
  resources :portfolios
  resources :experiences
  resources :moocs
  resources :open_universities  do
    #collection { post :search, to: 'open_universities#index' }
    collection do
      get 'search' => 'open_universities#index', :via => [:get, :post], :as => :search
      #get ipv match
    end
  end
  resources :games
  devise_for :users, :controllers => { :registrations => 'registrations'}
  devise_for :admins
  resources :studies
  resources :articles
  root 'articles#index'

  get ':id', to: 'pages#show'
  
  #toegevoegd
  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
