class FixColumnNameInScientists < ActiveRecord::Migration[5.0]
  def change
    rename_column :scientists, :date_of_birth, :year_of_birth
    rename_column :scientists, :date_of_death, :year_of_death
  end
end
