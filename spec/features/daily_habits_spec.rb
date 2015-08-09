require "rails_helper"

feature "user can log they did a habit for the day" do
  context "authenticated user" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in_as user
    end

    scenario "successfully" do
      habit = FactoryGirl.create(:habit, user: user)
      visit dashboard_path

      css = "li#habit_#{habit.id}"
      within(:css, css) do
        click_on "Crushed it!"
      end

      expect(page).to have_content("Completed habit for the day")
      within(:css, css) do
        expect(page).to_not have_button("Crushed it!")
      end
    end
  end
end
