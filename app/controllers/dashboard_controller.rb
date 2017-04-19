class DashboardController < ApplicationController

  def show
    @content = Content.find(1)
  end

end
