Rails.application.routes.draw do
  resources :robot_movements
  resources :movements
  resources :robots do
    member do
      get :place, :move, :left, :right
    end
  end
end
