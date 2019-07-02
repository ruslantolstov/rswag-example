# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api/docs' unless Rails.env.production?
  namespace :api do
    resources :articles, only: %i[index show create update destroy]
  end
end
