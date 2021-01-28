RSpec.describe Employee, type: :model do

    describe "Associations" do
        it { should have_many(:challenges)}
    end
end