class Challenge < ApplicationRecord
    belongs_to :employee
    validates_presence_of :title
    validates_presence_of :description
    validates_presence_of :tag
    validates_presence_of :employee_id
    has_many :votes, dependent: :destroy

    def voted_by?(user)
    votes.exists?(employee_id:user.id)
    end
end
