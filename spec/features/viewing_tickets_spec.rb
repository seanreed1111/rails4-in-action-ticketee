#viewing_tickets_spec.rb
require "rails_helper"

RSpec.feature "Users can view tickets" do
  before do
    author = FactoryGirl.create(:user)

    sublime = FactoryGirl.create(:project, name: "Sublime Text 3")
    FactoryGirl.create(:ticket, project: sublime, 
      name: "Make it Shiny!", 
      description: "Gradients! Starbursts! Oh My!")

    FactoryGirl.create(:ticket, project: sublime, author: author,
      name: "Standards compliance", description: "Isn't a joke.")

    visit "/"
  end

  scenario "for a given project" do
    click_link "Sublime Text 3"

      # expect(page).to have_content "Make it Shiny!"
      expect(page).to have_content "Standards compliance"

    # click_link "Make it Shiny!"

    # describe "after you click link 'Make it Shiny'" do
    #   within("#ticket h2") do
    #     expect(page).to have_content "Make it Shiny"
    #   end
    # end

  end
end