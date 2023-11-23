# frozen_string_literal: true

class PingController < ApplicationController
  def index
    render json: { data: 'pong' }
  end

end
