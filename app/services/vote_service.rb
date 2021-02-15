class Vote_service

    def upvoteservice(params,user)
        @challenge = Challenge.find(params)
        @challenge.votes.create(:employee_id => user.id)
    end

    def downvoteservice(params,user)
        @challenge = Challenge.find(params)
        @vote = Vote.where(challenge_id: @challenge, employee_id: user.id)
        Vote.delete(@vote.ids)
    end
end