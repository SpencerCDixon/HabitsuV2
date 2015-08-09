class DailyHabit < ActiveRecord::Base
  belongs_to :user
  belongs_to :habit

  scope :completed_today, -> {
    where('created_at > :beg AND created_at < :end',
    beg: Time.zone.now.beginning_of_day,
    end: Time.zone.now.end_of_day)
  }
end
