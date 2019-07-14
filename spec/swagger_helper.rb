# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  CLIENT_DOC = 'client/swagger.json'
  BACKOFFICE_DOC = 'backoffice/swagger.json'
  config.swagger_root = Rswag::Api.config.swagger_root
  config.swagger_docs = {
    CLIENT_DOC => {
      swagger: '2.0',
      info: {
        title: 'Rswag Example REST API Client',
        version: '1.0.0',
        description: 'Rswag Example REST API Client'
      },
      host: '',
      basePath: '/',
      paths: {},
      schemes: %w[
        http
        https
      ],
      consumes: ['application/json']
    },
    BACKOFFICE_DOC => {
      swagger: '2.0',
      info: {
        title: 'Rswag Example REST API Backoffice',
        version: '1.0.0',
        description: 'Rswag Example REST API Backoffice'
      },
      host: '',
      basePath: '/',
      paths: {},
      schemes: %w[
        http
        https
      ],
      consumes: ['application/json']
    }
  }
end
