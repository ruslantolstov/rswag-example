# frozen_string_literal: true

module Api
  module Client
    class ArticlesController < BaseController
      before_action :authenticate!, only: %i[create update destroy]

      def index
        articles = policy_scope(Article.all)
        render json: render_collection(articles)
      end

      def show
        authorize(article)
        render json: render_resource(article)
      end

      def create
        @article = current_user.articles.build(resource_params)
        authorize(@article)
        if @article.save
          render json: render_resource(@article), status: :created
        else
          render json: render_errors(@article), status: :unprocessable_entity
        end
      end

      def update
        authorize(article)
        if article.update(resource_params)
          render json: render_resource(article), status: :ok
        else
          render json: render_errors(article), status: :unprocessable_entity
        end
      end

      def destroy
        authorize(article)
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
