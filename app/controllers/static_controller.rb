class StaticController < ApplicationController

  def index
  end

  def item_takein
    respond_to do |format|
      format.html
      format.js
    end
	end

end