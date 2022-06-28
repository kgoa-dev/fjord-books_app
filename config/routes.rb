Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show following followers)
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users do
    resource :follow_relationships, only: [:create, :destroy]
    get 'following' => 'follow_relationships#following', as: 'following'
    get 'followers' => 'follow_relationships#followers', as: 'followers'
  end
end
