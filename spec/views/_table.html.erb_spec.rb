require "rails_helper"

RSpec.describe "challenges/_table", type: :view do
  include Devise::Test::ControllerHelpers
  let(:employee) { create(:employee) }
  let(:challenge) { create(:challenge, employee: employee) }
  let!(:vote) { create(:vote, challenge_id: challenge.id, employee_id: employee.id) }
  let!(:collab) { create(:collaborator, challenge_id: challenge.id, employee_id: employee.id) }
  before(:each) do
    sign_in(employee)
  end

  it "Renders the Homepage" do
    @challenge = Challenge.all

    render :partial => "challenges/table.html.erb"

    expect(rendered).to match ("/")
  end

  it "Renders the table" do
    @challenge = Challenge.all
    render
    assert_select "tr>td", challenge.id.to_s
    assert_select "tr>td", challenge.title
    assert_select "tr>td", challenge.description
    assert_select "tr>td", 1.to_s
    assert_select "tr>td", employee.fname
    assert_select "tr>td", challenge.created_at.to_s
    assert_select "tr>td", challenge.tag
  end
end
