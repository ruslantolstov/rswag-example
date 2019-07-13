# frozen_string_literal: true

module Api
  module Client
    class BaseController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include Pagy::Backend
      include Pundit

      before_action :authenticate!
      after_action :verify_authorized, except: :index
      after_action :verify_policy_scoped, only: :index

      attr_reader :current_user

      private

      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from Pundit::NotAuthorizedError, with: :not_authorized

      def not_found
        render json: { errors: ['Not Found'] }, status: :not_found
      end

      def not_authorized
        render json: { errors: ['Not Authorized'] }, status: :not_authorized
      end

      def render_collection(relation)
        pagy, items = pagy(relation, items: 25)
        {
          collection: "#{controller_path.classify}Decorator".constantize.decorate_collection(items),
          total_pages: pagy.pages,
          total_count: pagy.count,
          current_page: pagy.page
        }
      end

      def render_resource(resource)
        "#{controller_path.classify}Decorator".constantize.decorate(resource)
      end

      def render_errors(resource)
        {
          errors: resource.errors
        }
      end

      def authenticate!
        result = authenticate_with_http_token do |token|
          @current_user = User.find_by(authentication_token: token)
        end
        render json: { errors: ['Unauthorized'] }, status: :unauthorized unless result
      end
    end
  end
end
