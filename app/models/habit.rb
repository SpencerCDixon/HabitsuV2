class Habit < ActiveRecord::Base
  has_many :daily_habits
  belongs_to :user

  def completed_today?
    daily_habits.completed_today.exists?
  end

  def self.due_today
    today = Time.now.strftime("%A").downcase
    where(
      'frequency LIKE :today OR frequency LIKE :daily',
      today: today,
      daily: 'daily'
    )
  end

  def self.not_due_today
    today = Time.now.strftime("%A").downcase
    where(
      'frequency NOT LIKE :today AND frequency NOT LIKE :daily',
      today: today,
      daily: 'daily'
    )
  end
end
