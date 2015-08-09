require "rails_helper"

feature "users can view all their habits" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in_as user
  end

  scenario "successfully" do
    FactoryGirl.create(:habit, name: "Reading 15 minutes", user: user)
    visit dashboard_path

    expect(page).to have_content("Reading 15 minutes")
  end
end
