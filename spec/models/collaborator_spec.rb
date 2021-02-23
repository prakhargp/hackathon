require "rails_helper"
RSpec.describe Collaborator, type: :model do
  describe "Associations" do
    it { should belong_to(:employee) }
    it { should belong_to(:challenge) }
  end
end
