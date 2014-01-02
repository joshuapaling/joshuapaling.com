JoshuaPaling::Application.routes.draw do

  # redirect all www to non-www - from Duke's answer: http://stackoverflow.com/questions/4046960/how-to-redirect-without-www-using-rails-3-rack
  constraints(:host => /^www\./) do
    get "(*x)" => redirect { |params, request|
      URI.parse(request.url).tap {|url| url.host.sub!('www.', '') }.to_s
    }
  end

  root :to => 'posts#index'

  resources :posts, only: [:index] do
    resources :comments, :only => [:create]
  end

  get 'posts/category/:slug', to: 'posts#category', as: 'posts_category'
  get 'post/:slug', to: 'posts#show', as: 'post'

  get '/about', :to => 'pages#about'
  get '/o-and-x', :to => 'pages#o_and_x'

  namespace :admin do
    resources :posts
  end

  get '/404', :to => 'errors#not_found'
  get '/500', :to => 'errors#internal_error'
  get '/422', :to => 'errors#unprocessable_entity'
end
