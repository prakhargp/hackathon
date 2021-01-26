class ChallengeController < ApplicationController
    before_action :authenticate_employee!

    def index
       if params[:sort] == "created_at"
        @challenge = Challenge.all.order(params[:sort])
       elsif params[:sort] == "tag"
        @challenge = Challenge.all.order(params[:sort])
       else
        @challenge = Challenge.all.order(created_at: :desc)
       end
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

    def downvote
        @challenge = Challenge.find(params[:id])
        @vote = Vote.where(challenge_id: @challenge, employee_id: current_employee.id)
        Vote.delete(@vote.ids)
        redirect_to root_path
    end
    


end
