RSpec.describe Vote, type: :model do

    describe "Associations" do
        it {should belong_to(:employee) }
        it {should belong_to(:challenge) }
    end

end