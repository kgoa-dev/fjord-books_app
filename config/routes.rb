Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: 'books#index'
  devise_for :users
  resources :users, only: %i[index show]
  resources :books
end
