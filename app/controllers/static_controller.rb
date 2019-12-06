class StaticController < ApplicationController

  def index
  puts "static index controller"
    respond_to do |format|
      format.html
      format.js
    end
  end
end