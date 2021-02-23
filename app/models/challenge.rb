class Challenge < ApplicationRecord
  belongs_to :employee
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :tag

  has_many :votes, dependent: :destroy
  has_many :collaborators, dependent: :destroy

  def voted_by?(employee, challenge)
    Vote.all.exists?(employee_id: employee.id, challenge_id: challenge.id)
  end

  def collab_by?(employee, challenge)
    Collaborator.all.exists?(employee_id: employee.id, challenge_id: challenge.id)
  end

  def collaboraters_name(challenge_id)
    e_id = ""
    user_id = Collaborator.select(:employee_id).where(challenge_id: challenge_id)
    user_id.each do |user|
      e_id += (Employee.find(user.employee_id).emp).to_s + " "
    end
    return(e_id)
  end
end
