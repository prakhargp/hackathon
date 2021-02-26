class VoteCollab
  def initialize(params, user)
    @params = params
    @user = user
    @challenge = Challenge.find(@params)
  end

  def create_factory(model)
    if model.create(:challenge_id => @challenge.id, :employee_id => @user.id)
      return true
    end
  end

  def delete_factory(model)
    @record = model.find_by(challenge_id: @challenge.id, employee_id: @user.id)
    if model.delete(@record.id)
      return true
    end
  end
end
