class CreateScientists < ActiveRecord::Migration[5.0]
  def change
    create_table :scientists do |t|
      t.string :full_name
      t.date :date_of_birth
      t.date :date_of_death
      t.string :gender
      t.timestamps
    end
  end
end
