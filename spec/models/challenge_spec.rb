require "rails_helper"
RSpec.describe Challenge, type: :model do

    describe 'vailidate presence' do
        it { should validate_presence_of(:title)}
        it { should validate_presence_of(:description) }
        it { should validate_presence_of(:tag)}
    end

    describe "Associations" do 
        it { should belong_to(:employee)}
    end
end