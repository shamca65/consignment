class StaticController < ApplicationController

  def index
    js :showToast
  end

  def item_takein
    respond_to do |format|
      format.html
      format.js
    end
  end

  def find_customer
    render "customers/search"
  end

end