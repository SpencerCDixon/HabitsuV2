require 'rails_helper'

RSpec.describe Habit, type: :model do
  describe "#completed_today?" do
    context "has daily habit associated with it" do
      let(:habit) { FactoryGirl.create(:habit) }

      it "returns true if the dh was from today" do
        FactoryGirl.create(:daily_habit, habit: habit, created_at: Time.zone.now)
        expect(habit.completed_today?).to eq true
      end

      it "returns false if the dh was from another day" do
        FactoryGirl.create(:daily_habit, habit: habit, created_at: 3.days.ago)
        expect(habit.completed_today?).to eq false
      end
    end

    it "returns false if no dh are associated with it" do
      habit = FactoryGirl.build(:habit)
      expect(habit.completed_today?).to eq false
    end
  end
end
