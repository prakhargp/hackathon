class Challenge < ApplicationRecord
    belongs_to :employee
    validates_presence_of :title
    validates_presence_of :description
    validates_presence_of :tag

    has_many :votes, dependent: :destroy
    has_many :collaborators, dependent: :destroy

    def voted_by?(user)
      votes.exists?(employee_id:user.id)
    end
    def collab_by?(user)
      collaborators.exists?(employee_id:user.id)
    end

    def collaboraters_name(challenge_id)
        e_id = ""
        user_id = Collaborator.select(:employee_id).where(challenge_id: challenge_id)
        user_id.each do |user|
        e_id += (Employee.find(user.employee_id).emp).to_s+ " "
        end
        return(e_id)
      end
end
