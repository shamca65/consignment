class StaticController < ApplicationController

  def index
    #js :mega, :msg => 'Hack to testing'
  end

  def item_takein
    respond_to do |format|
      format.html
      format.js
    end
  end

end