class Habit < ActiveRecord::Base
  has_many :daily_habits
  belongs_to :user

  def completed_today?
    daily_habits.completed_today.exists?
  end
end
