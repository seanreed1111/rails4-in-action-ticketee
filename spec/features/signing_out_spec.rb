#signing_out_spec.rb

require "rails_helper"

RSpec.feature "Signed-in users can sign out" do
  let!(:user) {FactoryGirl.create(:user)}

  before do
    login_as(user)
  end

  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content "Signed out successfully."
  end
end

#need to explicitly include login_as, which is from Warden gem, in the rails_helper file