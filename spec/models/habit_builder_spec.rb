require "rails_helper"

describe HabitBuilder do
  describe "#build" do
    let(:user) { FactoryGirl.create(:user) }
    it "associates current user properly" do
      params = { name: 'brushing teeth', frequency: { "daily" => "1" } }
      HabitBuilder.new(user, params).build
      habit = Habit.last

      expect(habit.user).to eq user
    end

    it "uses daily for frequency if selected" do
      params = { name: 'brushing teeth', frequency: { "daily" => "1" } }
      HabitBuilder.new(user, params).build
      habit = Habit.last

      expect(habit.frequency).to eq "daily"
    end

    it "concacts days of the week with a comma if daily is not selected" do
      params = { name: 'brushing teeth', frequency: { "monday" => "1", "tuesday" => "1" } }
      HabitBuilder.new(user, params).build
      habit = Habit.last

      expect(habit.frequency).to eq "monday, tuesday"
    end
  end
end
