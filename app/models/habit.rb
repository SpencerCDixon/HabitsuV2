class Habit < ActiveRecord::Base
  has_many :daily_habits
  belongs_to :user
end
