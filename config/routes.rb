QuickBlog::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'posts#index'

  resources :posts, except: [:show] do
    resources :comments, :only => [:create]
  end

  get 'posts/category/:slug', to: 'posts#category', as: 'posts_category'
  get 'post/:slug', to: 'posts#show', as: 'post'

  get '/about', :to => 'pages#about'

  match '/404', :to => 'errors#not_found'
  match '/500', :to => 'errors#internal_error'
  match '/422', :to => 'errors#unprocessable_entity'
end
