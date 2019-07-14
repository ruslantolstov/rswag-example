# frozen_string_literal: true

module Api
  module Backoffice
    class ArticlePolicy < ApplicationPolicy
      def index?
        true
      end

      def show?
        true
      end

      def create?
        false
      end

      def update?
        true
      end

      def destroy?
        true
      end

      class Scope < Scope
        def resolve
          scope.all
        end
      end
    end
  end
end
