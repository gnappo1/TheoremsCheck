class ChangeNewDataTypeInScientistsTable < ActiveRecord::Migration[5.0]
  def change
    change_column :scientists, :year_of_birth, :integer
    change_column :scientists, :year_of_death, :integer
  end
end
