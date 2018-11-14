class StaticController < ApplicationController

  def index
    js :mega, :msg => 'test message'
  end

end