class AddEmplIdToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :emp, :string
  end
end
