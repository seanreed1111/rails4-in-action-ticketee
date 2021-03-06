require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it "handles a missing project correctly"  do
    get :show, id: "not-here"

    expect(response).to redirect_to(projects_path)

    message = "The project you were looking for was not found."
    expect(flash[:alert]).to eq message
  end

end
