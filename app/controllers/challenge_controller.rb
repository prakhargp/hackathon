class ChallengeController < ApplicationController
    before_action :authenticate_employee!

    def index
        @challenge = Challenge.all
    end

    def create
        @challenge = Challenge.new(params.require(:challenges).permit(:title, :description, :tag, :employee_id))
            if @challenge.save
                redirect_to root_path
            end
    end

    def upvote
        @challenge = Challenge.find(params[:id])
        @challenge.votes.create(:employee_id => current_employee.id)
        redirect_to root_path
    end
    
end
