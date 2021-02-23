require "rails_helper"

RSpec.describe "Vote_service" do
  let(:employee) { create(:employee) }
  let(:challenge) { create(:challenge, employee: employee) }

  describe "Upvote_Downvote_service" do
    it "upvote on a challenge" do
      upvote = VoteService.new(challenge.id, employee).upvoteservice
      expect(upvote).to eq(1)
    end

    it "downvote on a challenge" do
      vote = create(:vote, challenge_id: challenge.id, employee_id: employee.id)
      downvote = VoteService.new(challenge.id, employee).downvoteservice
      expect(downvote).to eq(1)
    end
  end
end
