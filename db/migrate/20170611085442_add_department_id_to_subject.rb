class AddDepartmentIdToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :department_id, :integer
  end
end
