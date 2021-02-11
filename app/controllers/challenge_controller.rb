class ChallengeController < ApplicationController
    before_action :authenticate_employee!

    def index

        @challenge = Challenge.paginate(:page => params[:page], :per_page => 3)
        tags_arr = []
        Tag.all.each do |tag| 
            tags_arr.push(tag.tag_name)  
        end 
    end

    def create
        @challenge = Challenge.new(params.require(:challenges).permit(:title, :description, :tag, :employee_id))
        @challenge.employee = current_employee    
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
    
    def collaborations
        @challenge = Challenge.find(params[:id])
        @challenge.collaborators.create(:employee_id => current_employee.id)
        redirect_to root_path
    end

    def cd
        @challenge = Challenge.find(params[:id])
        @collaboration = Collaborator.where(challenge_id: @challenge.id, employee_id: current_employee.id)
        Collaborator.delete(@collaboration.ids)
        redirect_to root_path
    end
end
