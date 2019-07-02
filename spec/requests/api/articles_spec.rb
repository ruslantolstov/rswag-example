# frozen_string_literal: true

require 'swagger_helper'

describe 'Articles' do
  path '/api/articles' do
    get 'Find all articles' do
      tags 'Articles'
      parameter name: :page, in: :query, type: :integer, description: 'Page number. Default: 1', required: false
      parameter name: :per_page, in: :query, type: :integer, description: 'Per page items. Default: 25', required: false

      response '200', :success do
        schema type: :object,
               properties: {
                 collection: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       title: { type: :string },
                       body: { type: :string }
                     }
                   }
                 }
               }
        let!(:article) { create(:article) }
        run_test!
      end
    end

    post 'Create new article' do
      tags 'Articles'
      parameter name: 'Authorization', in: :header, type: :string, default: 'Bearer c36e6eadde881ca7'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string }
        },
        required: %w[title body]
      }

      response '401', :unauthorized do
        let(:Authorization) { '' }
        let(:article) { { title: '22', body: '23423' } }
        run_test!
      end

      response '201', :created do
        let!(:user) { create(:user) }
        let(:Authorization) { 'Bearer ' + user.authentication_token }
        let(:article) { { title: '22', body: '23423' } }
        run_test!
      end

      response '422', :invalid_request do
        let!(:user) { create(:user) }
        let(:Authorization) { 'Bearer ' + user.authentication_token }
        let(:article) { { title: '22' } }
        run_test!
      end
    end
  end

  path '/api/articles/{id}' do
    get 'Find article by id' do
      tags 'Articles'
      parameter name: :id, in: :path, type: :integer
      response '200', :success do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 body: { type: :string }
               }
        let!(:id) { create(:article).id }
        run_test!
      end

      response '404', :not_found do
        let!(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Update article by id' do
      tags 'Articles'
      parameter name: :id, in: :path, type: :integer
      parameter name: 'Authorization', in: :header, type: :string, default: 'Bearer c36e6eadde881ca7'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string }
        },
        required: %w[title body]
      }
      response '200', :success do
        let!(:user) { create(:user) }
        let!(:id) { create(:article, user: user).id }
        let(:Authorization) { 'Bearer ' + user.authentication_token }
        let(:article) { { title: 'Title', body: 'Body' } }
        run_test!
      end

      response '404', :not_found do
        let!(:user) { create(:user) }
        let(:Authorization) { 'Bearer ' + user.authentication_token }
        let(:article) { { title: 'Title', body: 'Body' } }
        let!(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Delete article by id' do
      tags 'Articles'
      parameter name: :id, in: :path, type: :integer
      parameter name: 'Authorization', in: :header, type: :string, default: 'Bearer c36e6eadde881ca7'
      response '204', :no_content do
        let!(:user) { create(:user) }
        let(:Authorization) { 'Bearer ' + user.authentication_token }
        let!(:id) { create(:article, user: user).id }
        run_test!
      end

      response '404', :not_found do
        let!(:user) { create(:user) }
        let(:Authorization) { 'Bearer ' + user.authentication_token }
        let!(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
