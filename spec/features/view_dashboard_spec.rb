require "rails_helper"

feature "viewing dashboard" do
  context "as an authenticated user" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      FactoryGirl.create(:quote, text: "Just do it.")
      sign_in_as user
    end

    scenario "when I sign in I get redirected to my dashboard" do
      expect(page).to have_content("Welcome, #{user.email}")
    end

    scenario "I am presented with a daily motivational quote" do
      expect(page).to have_content("Just do it.")
    end
  end
end
