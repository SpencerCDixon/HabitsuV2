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

  context "habits based on due date" do
    let(:daily_habit) { FactoryGirl.create(:habit, frequency: "daily") }
    let(:due_today) { FactoryGirl.create(:habit, frequency: "sunday") }
    let(:due_monday) { FactoryGirl.create(:habit, frequency: "monday") }

    before do
      sunday = Time.local(2015, 8, 9, 12, 0, 0)
      Timecop.travel(sunday)
    end

    describe ".due_today" do
      it "returns habits that are due today" do
        expect(described_class.due_today).to include daily_habit
        expect(described_class.due_today).to include due_today
        expect(described_class.due_today).to_not include due_monday
      end
    end

    describe ".not_due_today" do
      it "returns habits not due today" do
        expect(described_class.not_due_today).to include due_monday
        expect(described_class.not_due_today).to_not include daily_habit
        expect(described_class.not_due_today).to_not include due_today
      end
    end
  end
end
