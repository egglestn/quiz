class DashboardController < ApplicationController

  def show
    @content = Content.where(key="Welcome")
  end

end
