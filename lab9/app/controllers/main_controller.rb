# frozen_string_literal: true

class MainController < ApplicationController
  def index
    redirect_to '/compute/input'
  end
end
