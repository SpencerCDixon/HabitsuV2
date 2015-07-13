class DashboardsController < ApplicationController
  def show
    # TODO: create a quote finder so I'm not making expensive query
    @quote = QuoteFinder.perform
  end
end
