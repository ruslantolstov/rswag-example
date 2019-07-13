# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api/client/docs' unless Rails.env.production?
  namespace :api do
    namespace :client do
      resources :articles, only: %i[index show create update destroy]
    end
  end
end
