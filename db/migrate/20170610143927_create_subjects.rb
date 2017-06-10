class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
