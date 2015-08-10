class DailyHabitsController < ApplicationController
  def create
    habit = Habit.find(params[:habit_id])
    dh = DailyHabit.new(user: current_user, habit: habit)
    dh.save
    render json: { message: "Completed habit for the day" }
  end
end
