
require "rails_helper"

RSpec.describe "Challenge", type: :request do 

    let(:employee) { build(:employee) }
    let(:challenge) { build(:challenge, employee: employee) }

    before(:each) do
        sign_in(employee) 
        challenge.employee = employee
      end
      challenge_params = FactoryBot.attributes_for(:challenge)

    describe "GET/index" do
        it "Show all challenges" do
            get challenge_index_url
            expect(response).to be_successful
        end
    end

    describe "POST/create" do

        it "Create a new challenge" do
            expect { post challenge_index_url, params:{challenges: challenge_params}}.to change(Challenge, :count).by(1)
        end
    end

end