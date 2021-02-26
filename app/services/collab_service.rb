# class CollabService
#   def initialize(params, user)
#     @params = params
#     @user = user
#   end

#   def collaborationsservice
#     @challenge = Challenge.find(@params)
#     if @challenge.collaborators.create(:employee_id => @user.id)
#       return 1
#     end
#   end

#   def collaborationsdeleteservice
#     @challenge = Challenge.find(@params)
#     @collaboration = Collaborator.where(challenge_id: @challenge.id, employee_id: @user.id)
#     if Collaborator.delete(@collaboration.ids)
#       return 1
#     end
#   end
# end

class CollabService < VoteCollab
  def create_factory(model)
    super
  end

  def delete_factory(model)
    super
  end
end
