class StaticController < ApplicationController

  def index
    if user_signed_in?
      js :notify, :msg => 'Successfully signed in'
    end
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