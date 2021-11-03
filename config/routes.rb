# frozen_string_literal: true

Rails.application.routes.draw do
  root 'greetings#index'
  get 'privacy_policy', to: 'greetings#privacy_policy'
  authenticate :user do
    resources :reminders
  end
  get '/moo', to: 'greetings#moo'
  get '/spongebob_meme_maker', to: 'greetings#spongebob_meme_maker'
  RenderCow.characters.each do |character|
    get "/#{character}", to: "greetings##{character}"
  end

  post '/greet', to: 'greetings#greet'
  post '/time_zone', to: 'application#time_zone'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
