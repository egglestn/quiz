# Controller for the landing page dashboard
class DashboardController < ApplicationController
  def show
    content_lowest = Content.minimum(:id)
    @content = Content.find(content_lowest)
  end
end
