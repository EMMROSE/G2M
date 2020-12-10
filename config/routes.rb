Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'furnishers', to: 'pages#fournisseurs'
  get 'pricer', to: 'pages#pricer'
  get 'stocks', to: 'pages#stocks'
  get 'comptabilite', to: 'pages#comptabilite'
  get 'stat', to: 'pages#stat'
  get 'repartition', to: 'pages#repartition'
  get 'pro', to: 'pages#pro'

  resources :fournisseurs do
    resources :paiements, only: [ :index, :show, :new, :create ]
  end
  resources :selections do
    resources :products, only: [ :index, :new, :create ]
  end
  resources :products, only: [ :index, :edit, :update, :destroy, :show]
    post 'products/:id/sold', to: "products#sold_status", as: "sold_status"
    post 'products/:id/sell', to: "products#tosell_status", as: "tosell_status"
    post 'products/:id/return', to: "products#return_status", as: "return_status"
    post 'products/:id/edit_price', to: "products#edit_price", as: "edit_price"
    post 'products/duplicate', to: "products#duplicate", as: "duplicate"
    post 'products/import', to: "products#import", as: "import"
    get 'products/:id/stock4pro', to: "products#stock4pro", as: "stock4pro"
    get 'products/:id/select4pro', to: "products#select4pro", as: "select4pro"

  resources :paiements, only: [ :edit, :update, :destroy]
    post 'paiements/:id/settle', to: "paiements#settle_status", as: "settle_status"

  get 'selections/:id/csv', to: "selections#csv", as: "selection_csv"
  get 'selections/:id/mail', to: "selections#mail", as: "selection_mail"
  get 'selections/:id/summary', to: "selections#summary", as: "selection_summary"
  get 'selections/:id/etiquette', to: "selections#etiquette", as: "selection_etiquette"
  get 'carts/devis', to: "carts#devis", as: "devis"

  resources :brands
  resources :clothes
  resources :colors
  resources :tarifs
  post 'products/:id/save_price', to: "products#save_price", as: "save_price"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
