Rails.application.routes.draw do

  root to: 'categories#index'

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  
  get '/min' => 'products#min',:as  => 'min'
  get '/max' => 'products#max',:as  => 'max'

  get '/search' => 'pages#search', :as => 'search_page'
end
