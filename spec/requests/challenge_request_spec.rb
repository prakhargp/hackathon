require "rails_helper"

RSpec.describe "Challenge", type: :request do
  let(:employee) { create(:employee) }
  let(:challenge) { create(:challenge, employee: employee) }
  let!(:vote) { create(:vote, challenge_id: challenge.id, employee_id: employee.id) }
  let!(:collab) { create(:collaborator, challenge_id: challenge.id, employee_id: employee.id) }
  before(:each) do
    sign_in(employee)
    challenge.employee = employee
  end

  challenge_params = FactoryBot.attributes_for(:challenge)

  describe "GET/index" do
    it "Show all challenges" do
      get challenges_url
      expect(response).to have_http_status(200)
    end
  end

  describe "POST/create" do
    it "Create a new challenge" do
      expect { post challenges_url, params: { challenges: challenge_params } }.to change(Challenge, :count).by(1)
    end
  end

  describe "Upvote" do
    it "upvote a challenge" do
      expect { post upvote_challenge_url(:id => challenge.id) }.to change(Vote, :count).by(1)
    end
  end

  describe "Collaborations" do
    it "collab on a challenge" do
      expect { post collaborations_challenge_url(:id => challenge.id) }.to change(Collaborator, :count).by(1)
    end
  end

  describe "Downvote" do
    it "Deletes a vote" do
      expect { delete downvote_challenge_url(:id => challenge.id) }.to change(Vote, :count).by(-1)
    end
  end

  describe "Collaborations_delete" do
    it "Deletes a Collaboration" do
      expect { delete collaborationsdelete_challenge_url(:id => challenge.id) }.to change(Collaborator, :count).by(-1)
    end
  end
end
