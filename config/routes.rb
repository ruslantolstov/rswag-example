# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api/docs' unless Rails.env.production?
  namespace :api do
    namespace :backoffice do
      resources :articles, only: %i[index show update destroy]
    end
    namespace :client do
      resources :articles, only: %i[index show create update destroy]
    end
  end
end
