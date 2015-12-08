MppBlog::Engine.routes.draw do
  resources :posts do 
    collection do
      get :popular
      get "/popular/:category" => 'posts#popular'
      get :all
      get "/all/:category" => 'posts#all'
      get :draft
      get "/draft/:category" => 'posts#draft'
      get :published
      get :sort_popular
      get "/published/:category" => 'posts#published'
      get "/category/:category" => 'posts#category'        
      get :subscription
      get :no_subscription
    end 
    member do
      put :update_popular
    end
  end
  resources :search, param: :q, only: [:index]
  root "posts#index"
end
