require "rails_helper"

feature "daily habits" do
  context "authenticated user can log they did a habit" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in_as user }

    scenario "successfully" do
      habit = FactoryGirl.create(:habit, user: user)
      visit dashboard_path

      css = "li#habit_#{habit.id}"
      within(:css, css) do
        click_on "Crushed it!"
      end

      expect(page.source).to match(/Completed habit for the day/)
      within(:css, css) do
        expect(page).to_not have_button("Crushed it!")
      end
    end
  end

  context "habits due today appear at top" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in_as user
      sunday = Time.local(2015, 8, 9, 12, 0, 0)
      Timecop.travel(sunday)
    end

    scenario "successfully" do
      due_today = FactoryGirl.create(
        :habit,
        user: user,
        frequency: "daily",
        name: "Coding"
      )
      not_due_today = FactoryGirl.create(
        :habit,
        user: user,
        frequency: "monday",
        name: "Go on a run"
      )

      visit dashboard_path

      within(:css, "div#due_today") do
        expect(page).to have_content(due_today.name)
        expect(page).to_not have_content(not_due_today.name)
      end
    end
  end
end
