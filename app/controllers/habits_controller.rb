class HabitsController < ApplicationController
  def new
    @habit = Habit.new
  end

  def create
    if HabitBuilder.new(current_user, habit_params).build
      redirect_to dashboard_path,
        notice: "Successfully created new habit.  Good luck!"
    else
      render :new
    end
  end

  private

  def habit_params
    params.require(:habit).permit(
      :name, frequency: [
        :monday, :tuesday,
        :wednesday, :thursday,
        :friday, :saturday,
        :sunday, :daily
      ])
  end
end
