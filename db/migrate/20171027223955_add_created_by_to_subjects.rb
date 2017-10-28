class AddCreatedByToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :created_by, :string
  end
end
