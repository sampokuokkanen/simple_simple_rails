Rails.application.routes.draw do
  root 'greetings#index'
  authenticate :user do
    resources :reminders
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
