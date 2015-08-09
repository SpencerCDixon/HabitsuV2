class DashboardsController < ApplicationController
  def show
    @quote = QuoteFinder.perform
    @habits = current_user.habits.all
  end
end
