Bloccit::Application.routes.draw do

  get 'comments/create'

  devise_for :users
    resources :users, only: [:update, :show, :index]

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
