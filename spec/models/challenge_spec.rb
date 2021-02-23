require "rails_helper"
RSpec.describe Challenge, type: :model do
  let!(:employee) { create(:employee) }
  let!(:challenge) { create(:challenge, employee: employee) }
  let!(:collab) { create(:collaborator, challenge_id: challenge.id, employee_id: employee.id) }
  let!(:vote) { create(:vote, challenge_id: challenge.id, employee_id: employee.id) }

  describe "Vailidates presence" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:tag) }
  end

  describe "Associations" do
    it { should belong_to(:employee) }
    it { should have_many(:votes) }
    it { should have_many(:collaborators) }
  end

  describe "Voted_by_current_user" do
    it "vote exist" do
      voted_by = Challenge.new.voted_by?(employee, challenge)
      expect(voted_by).to be(true)
    end
  end
  describe "Collab_by_current_user" do
    it "collab exist" do
      collab_by = Challenge.new.collab_by?(employee, challenge)
      expect(collab_by).to be(true)
    end
  end
  describe "collaborators_name" do
    it "collab_name" do
      collaborator_name = Challenge.new.collaboraters_name(challenge.id)
      expect(collaborator_name).to eq("#{employee.emp} ")
    end
  end
end
