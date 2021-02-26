require "rails_helper"

RSpec.describe "challenges/index", type: :view do
  include Devise::Test::ControllerHelpers
  let(:employee) { create(:employee) }
  let(:challenge) { create(:challenge, employee: employee) }
  let!(:vote) { create(:vote, challenge_id: challenge.id, employee_id: employee.id) }
  let!(:collab) { create(:collaborator, challenge_id: challenge.id, employee_id: employee.id) }
  before(:each) do
    @challenge = Challenge.all
    sign_in(employee)
    render template: "challenges/index"
  end

  it "Renders the Homepage" do
    expect(rendered).to match("/")
  end

  it "Renders Each Element" do
    assert_select "div" do
      assert_select ".home", text: "Home"
      assert_select "div.hackathon", text: "Hackathon"
    end
  end
end
