class StaticController < ApplicationController

  def login

  end

  def index
      flash[:success] = "Welcome to notify-on-rails"
  end

end