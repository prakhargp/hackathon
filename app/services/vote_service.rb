class VoteService
  def initialize(params, user)
    @params = params
    @user = user
  end

  def upvoteservice
    @challenge = Challenge.find(@params)
    if @challenge.votes.create(:employee_id => @user.id)
      return 1
    end
  end

  def downvoteservice
    @challenge = Challenge.find(@params)
    @vote = Vote.find_by(challenge_id: @challenge, employee_id: @user.id)
    if Vote.delete(@vote.id)
      return 1
    end
  end
end
