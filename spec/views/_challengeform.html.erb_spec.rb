require "rails_helper"

RSpec.describe "challenges/_challengeform", type: :view do
  include Devise::Test::ControllerHelpers
  let(:employee) { create(:employee) }
  let(:challenge) { create(:challenge, employee: employee) }
  let!(:vote) { create(:vote, challenge_id: challenge.id, employee_id: employee.id) }
  let!(:collab) { create(:collaborator, challenge_id: challenge.id, employee_id: employee.id) }

  it "Renders the form" do
    sign_in(employee)
    render :partial => "challenges/challengeform.html.erb"
    # byebug
    expect(rendered).to match "/"
  end

  it "Add challenges form" do
    sign_in(employee)
    render :partial => "challenges/challengeform.html.erb"
    assert_select "form"
    assert_select "input[name=?]", "challenges[title]"
    assert_select "input[name=?]", "challenges[description]"
    assert_select "select[name=?]", "challenges[tag]"
    assert_select "input[value=?]", "Add Challenge"
  end
end
