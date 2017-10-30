class ChangeDataTypeInScientistsTable < ActiveRecord::Migration[5.0]
  def change
    change_column :scientists, :year_of_birth, :string
    change_column :scientists, :year_of_death, :string
  end
end
