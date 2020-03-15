Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :show, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
