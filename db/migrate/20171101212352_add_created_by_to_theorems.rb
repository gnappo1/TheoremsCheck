class AddCreatedByToTheorems < ActiveRecord::Migration[5.0]
  def change
    add_column :theorems, :created_by, :string
  end
end
