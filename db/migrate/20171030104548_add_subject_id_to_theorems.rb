class AddSubjectIdToTheorems < ActiveRecord::Migration[5.0]
  def change
    add_column :theorems, :subject_id, :integer
  end
end
