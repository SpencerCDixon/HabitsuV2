class DashboardsController < ApplicationController
  def show
    @quote = QuoteFinder.perform
  end
end
