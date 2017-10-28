class AddCreatedByToScientist < ActiveRecord::Migration[5.0]
  def change
    add_column :scientists, :created_by, :string
  end
end
