class DashboardsController < ApplicationController
  def show
    @quote = QuoteFinder.perform
    @habits_for_today = current_user.habits.due_today
    @habits_for_later = current_user.habits.not_due_today
  end
end
