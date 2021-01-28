RSpec.describe Collaborator, type: :model do
    describe "Associations" do
        it { should belong_to(:employee)}
    end
end