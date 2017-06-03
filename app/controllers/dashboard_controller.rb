# Controller for the landing page dashboard
class DashboardController < ApplicationController
  def show
    @content = Content.find(1) if current_user.default?
  end
end
