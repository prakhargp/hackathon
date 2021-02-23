require "rails_helper"
RSpec.describe Employee, type: :model do
  describe "Associations" do
    it { should have_many(:challenges) }
    it { should have_many(:collaborators) }
  end
  describe "Vailidates presence" do
    it { should validate_presence_of(:emp) }
    it { should validate_presence_of(:fname) }
    it { should validate_presence_of(:lname) }
  end
end
