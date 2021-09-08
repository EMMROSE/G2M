Rails.application.routes.draw do
  get 'justificatifs/new'
  get 'justificatifs/create'
  devise_for :users
  root to: 'pages#home'
  get 'furnishers', to: 'pages#fournisseurs'

  get 'price', to: 'pages#price'
  get 'brands/:id/pricer', to: 'pages#pricer'

  get 'stocks', to: 'pages#stocks'
  get 'panier', to: 'pages#panier'
  get 'comptabilite', to: 'pages#comptabilite'
  get 'creditdetail', to: 'pages#creditdetail'
  get 'stat', to: 'pages#stat'
  get 'fiche', to: 'pages#fiche'
  get 'repartition', to: 'pages#repartition'
  get 'repartitionage', to: 'pages#repartitionage'
  get 'repartitiongenre', to: 'pages#repartitiongenre'
  get 'venteparsku', to: 'pages#venteparsku'
  get 'pro', to: 'pages#pro'
  get 'caisse', to: 'pages#caisse'

  resources :fournisseurs do
    resources :paiements, only: [ :index, :show, :new, :create]
    resources :justificatifs, only: [:new, :create]
  end

  resources :justificatifs, only: [:edit, :update]
  post 'justificatifs/:id/don', to: "justificatifs#don", as: "don"

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
    get 'products/:id/qrcode', to: "products#qrcode", as: "qrcode"

  resources :paiements, only: [ :edit, :update, :destroy]
    post 'paiements/:id/settle', to: "paiements#settle_status", as: "settle_status"
    post 'paiements/avoir', to: "paiements#avoir", as: "avoir"
    post 'paiements/:id/edit_amount', to: "paiements#edit_amount", as: "edit_amount"

  get 'fournisseurs/:id/save_csv', to: "fournisseurs#save_csv", as: "fournisseur_save_csv"

  get 'selections/:id/csv', to: "selections#csv", as: "selection_csv"
  get 'selections/:id/mail', to: "selections#mail", as: "selection_mail"
  get 'selections/:id/summary', to: "selections#summary", as: "selection_summary"
  get 'selections/:id/return', to: "selections#return", as: "selection_return"
  get 'selections/:id/etiquette', to: "selections#etiquette", as: "selection_etiquette"
  get 'carts/devis', to: "carts#devis", as: "devis"

  resources :brands
  resources :clothes
  resources :colors
  resources :tarifs
    get 'brands/:id/tarifsbybrand', to: "tarifs#tarifsbybrand", as: "tarifsbybrand"
    get 'brands/research', to: "brands#research", as: "research"

  post 'products/:id/save_price', to: "products#save_price", as: "save_price"

  # resources :sessions
  post 'sessions/display', to: "sessions#display", as: "display"
  post 'sessions/list', to: "sessions#list", as: "list"
  get 'products/:id/add_to_list', to: "products#add_to_list", as: "add_to_list"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
