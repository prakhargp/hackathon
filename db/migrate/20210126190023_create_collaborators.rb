class CreateCollaborators < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborators do |t|
      t.references :employee, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
