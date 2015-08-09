class CreateDailyHabits < ActiveRecord::Migration
  def change
    create_table :daily_habits do |t|
      t.integer :user_id
      t.integer :habit_id
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
