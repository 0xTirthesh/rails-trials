# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      def index
        # Version 1 index action

        render json: {
          data: {
            :todos => []
          }
        }
      end

      def show
        # Version 1 show action
      end

      # Other version 1 actions
    end
  end
end