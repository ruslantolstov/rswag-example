# frozen_string_literal: true

module Api
  module Client
    class ArticlePolicy < ApplicationPolicy
      def index?
        true
      end

      def show?
        true
      end

      def create?
        true
      end

      def update?
        record.user_id == user.id
      end

      def destroy?
        record.user_id == user.id
      end

      class Scope < Scope
        def resolve
          scope.all
        end
      end
    end
  end
end
