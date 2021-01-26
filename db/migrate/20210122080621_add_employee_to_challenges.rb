class AddEmployeeToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_reference :challenges, :employee, foreign_key: true
  end
end
