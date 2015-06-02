class SubscribeController < ApplicationController

  def index
  end

  def create
    @name = params[:name]
    @email = params[:email]
  end
end
