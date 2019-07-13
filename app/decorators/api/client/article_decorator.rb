# frozen_string_literal: true

module Api
  module Client
    class ArticleDecorator < Draper::Decorator
      delegate_all

      decorates_association :user, with: UserDecorator

      def as_json(*)
        json = {
          id: id,
          title: title,
          body: body,
          user: user
        }
        json
      end
    end
  end
end
