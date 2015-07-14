class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :name, null: false
      t.integer :current_streak
      t.string :frequency, null: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
