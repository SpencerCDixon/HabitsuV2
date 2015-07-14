require "rails_helper"

feature "user creates a habit" do
  context "authenticated user" do
    scenario "successfully create a new habit" do
      user = FactoryGirl.create(:user)
      sign_in_as user

      click_on "Add habit"
      fill_in "Name", with: "Brushing teeth"
      check "Daily"
      click_on "Add Habit"

      expect(page).to have_content('Successfully created new habit.  Good luck!')
    end

    scenario "forget to include name for habit"
    scenario "forget to include tracking days"
  end
end
