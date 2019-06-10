require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :v1 do
    get 'libraries' => 'libraries#index'

    get 'catalogues' => 'catalogues#index'
    get 'movies' => 'catalogues#movies'
    get 'seasons' => 'catalogues#seasons'

    post 'purchase' => 'options#purchase'
  end
end
