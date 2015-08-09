Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resource :dashboard, only: :show
  resources :habits, only: [:new, :create] do
    resources :daily_habits, only: :create
  end

  post '/twilio/reply' => "twilio#reply"
end
