require "rails_helper"

RSpec.describe "Collab_service" do
  let(:employee) { create(:employee) }
  let(:challenge) { create(:challenge, employee: employee) }

  describe "collab_decollab_service" do
    it "Collab on a challenge" do
      collab = CollabService.new(challenge.id, employee).collaborationsservice
      expect(collab).to eq(1)
    end

    it "DeCollab on a challenge" do
      decollab = CollabService.new(challenge.id, employee).collaborationsdeleteservice
      expect(decollab).to eq(1)
    end
  end
end
