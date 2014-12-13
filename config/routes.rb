Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

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
      root 'dashboard/blogs#index', as: :root
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

    get '/messages/new' => 'messages#new', as: :new_message
    post '/messages/new' => 'messages#create'
    get '/messages/:id/edit' => 'messages#edit', as: :edit_message
    patch '/messages/:id/edit' => 'messages#update'
    get '/messages' => 'messages#index', as: :messages

    root 'blogs#index'

    scope '/blogs/:alias', as: :blog do
      get '/posts/new' => 'posts#new', as: :new_post
      post '/posts/new' => 'posts#create'
      get '/posts/:id/edit' => 'posts#edit', as: :edit_post
      patch '/posts/:id/edit' => 'posts#update'
      get '/posts' => 'posts#index', as: :posts

      get '/comments/reply' => 'comments#new', as: :new_comment
      post '/comments/reply' => 'comments#create'
      get '/comments' => 'comments#index', as: :comments
    end
  end
end
