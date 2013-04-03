Yaelog::Application.routes.draw do
  root to: "top#index"
  get "about" => "top#about", as: "about"

  resource :member, only: [:show, :edit, :update] do
  	collection { get "login" }
  end

  resources :entries do
  	collection { get "group" }
  	collection { get "search" }
  	collection { get "archives" }
  end

  resource :session, only:[:create, :destroy]

end
