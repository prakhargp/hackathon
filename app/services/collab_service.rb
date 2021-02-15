class Collab_service

    def collaborationsservice(a,b)
        @challenge = Challenge.find(a)
        @challenge.collaborators.create(:employee_id => b.id)
    end

    def collaborationsdeleteservice(a,b)
        @challenge = Challenge.find(a)
        @collaboration = Collaborator.where(challenge_id: @challenge.id, employee_id: b.id)
        Collaborator.delete(@collaboration.ids)
    end
end