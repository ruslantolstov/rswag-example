# frozen_string_literal: true

module Api
  module Backoffice
    class ArticlesController < BaseController
      before_action :authenticate!, only: %i[create update destroy]

      def index
        articles = policy_scope(Article.all, policy_scope_class: ArticlePolicy::Scope)
        render json: render_collection(articles)
      end

      def show
        authorize(article, :show?, policy_class: ArticlePolicy)
        render json: render_resource(article)
      end

      def update
        authorize(article, :update?, policy_class: ArticlePolicy)
        if article.update(resource_params)
          render json: render_resource(article), status: :ok
        else
          render json: render_errors(article), status: :unprocessable_entity
        end
      end

      def destroy
        authorize(article, :destroy?, policy_class: ArticlePolicy)
        article.destroy
        head :no_content
      end

      private

      def article
        @article ||= Article.find(params[:id])
      end

      def resource_params
        params.permit(:title, :body)
      end
    end
  end
end
