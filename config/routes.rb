Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get '/home' => 'pages#home'

  devise_for :users

  scope '/blogs/:alias', as: :blog do
    get '/posts' => 'posts#index', as: :posts
    get '/posts/:id' => 'posts#show', as: :post
    get '/archives/:date' => 'posts#archives', as: :archives
    post '/posts/:post_id/comments/create' => 'comments#create', as: :post_new_comment
    root 'posts#index'
  end

  devise_scope :user do
    authenticated :user do
      root 'dashboard/blogs#index', as: :authenticated_root
    end

    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
    end
  end

  namespace :dashboard do
    get '/blogs/new' => 'blogs#new', as: :new_blog
    post '/blogs/new' => 'blogs#create'
    get '/blogs/:alias/edit' => 'blogs#edit', as: :edit_blog
    patch '/blogs/:alias/edit' => 'blogs#update'
    get '/blogs' => 'blogs#index', as: :blogs
    get '/blogs/:alias' => 'blogs#show', as: :blog
    get '/blogs/:alias/customise' => 'blogs#edit', as: :customise_blog
    patch '/blogs/:alias/customise' => 'blogs#update'
    
    scope '/blogs/:alias', as: :blog do
      get '/posts/new' => 'posts#new', as: :new_post
      post '/posts/new' => 'posts#create'
      get '/posts/:id/edit' => 'posts#edit', as: :edit_post
      patch '/posts/:id/edit' => 'posts#update'
      get '/posts' => 'posts#index', as: :posts
    end
  end
end

