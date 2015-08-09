class DailyHabitsController < ApplicationController
  def create
    habit = Habit.find(params[:habit_id])
    dh = DailyHabit.new(user: current_user, habit: habit)

    if dh.save
      flash[:notice] = "Completed habit for the day"
    end
    redirect_to :back
  end
end
