Rails.application.routes.draw do
  resources :collections, only: [:show, :edit, :destroy]
  get '/collections/:id/revisions' => 'collections#revisions', as: 'collection_revisions'
  get '/collections/:id/revert/:revision_id' => 'collections#revert', as: 'revert_collection'
  get '/collections/:id/clone' => 'collections#clone', as: 'clone_collection'

  resources :drafts do
    get 'edit/:form' => 'drafts#edit', as: 'edit_form'
    post 'publish' => 'drafts#publish', as: 'publish'
    get 'download' => 'drafts#download_xml', as: 'download'
  end
  get 'welcome/index'
  get 'welcome/collections'

  get 'search' => 'search#index', as: 'search'

  get 'dashboard' => 'pages#dashboard', as: 'dashboard'
  get 'new_record' => 'pages#new_record', as: 'new_record'

  get 'login' => 'users#login'
  get 'logout' => 'users#logout'
  get 'urs_callback' => 'oauth_tokens#urs_callback'

  post 'convert' => 'conversions#convert'

  get 'set_provider' => 'users#set_provider'
  get 'refresh_providers' => 'users#refresh_providers', as: 'refresh_user_providers'

  # Small, light weight check if the app is running
  get 'status' => 'welcome#status'

  root 'welcome#index'
end
