class Subdomain
  def self.matches?(request)
    subdomains = request.subdomains.dup
    subdomains.pop
    subdomains.pop
    subdomains.present? && subdomains.length == 1
  end 
end

Rails.application.routes.draw do
  devise_for :users

  constraints(Subdomain) do
    get '/' => 'posts#index'
    get '/archives/:date' => 'posts#archives', as: :archive
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create]
    end

    namespace :dashboard do
      get '/' => 'blogs#show', as: :blogs
      get '/customise', to: 'blogs#edit', as: :customise_blog
      patch '/', to: 'blogs#update', as: :customise_blog_patch
      resources :posts
    end
  end

  namespace :dashboard do
    get '/' => 'blogs#index'
    get '/blogs/new', to: 'blogs#new', as: :new_blog
    post '/', to: 'blogs#create', as: :new_blog_post
  end

  devise_scope :user do
    authenticated :user do
      root 'dashboard/blogs#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
