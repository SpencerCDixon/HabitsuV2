class HabitBuilder

  attr_reader :user, :params
  def initialize(user, params)
    @user, @params = user, params
  end

  def build
    if daily_habit?
      habit = Habit.new(name: params[:name], frequency: "daily")
    else
      habit = Habit.new(name: params[:name], frequency: habit_frequency)
    end

    habit.user = user
    habit.save!
  end

  private

  def habit_frequency
    days = params[:frequency].find_all do |k, v|
      v == "1"
    end.flatten
    days.delete("1")
    days.map(&:downcase).join(', ')
  end

  def daily_habit?
    params[:frequency]["daily"] == "1"
  end
end
