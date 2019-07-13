# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  CLIENT_DOC = 'client/swagger.json'
  config.swagger_root = Rswag::Api.config.swagger_root
  config.swagger_docs = {
    CLIENT_DOC => {
      swagger: '2.0',
      info: {
        title: 'Rswag Example REST API',
        version: '1.0.0',
        description: 'Rswag Example REST API'
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
