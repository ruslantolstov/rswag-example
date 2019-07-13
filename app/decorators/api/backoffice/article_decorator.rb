# frozen_string_literal: true

module Api
  module Backoffice
    class ArticleDecorator < Draper::Decorator
      delegate_all

      def as_json(*)
        json = {
          id: id,
          title: title,
          body: body
        }
        json
      end
    end
  end
end
