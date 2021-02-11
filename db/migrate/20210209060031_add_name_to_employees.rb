class AddNameToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :fname, :string
    add_column :employees, :lname, :string
  end
end
