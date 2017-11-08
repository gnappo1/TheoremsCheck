class CreateCorollaries < ActiveRecord::Migration[5.0]
  def change
    create_table :corollaries do |t|
      t.string :name
      t.text :statement
      t.text :demonstration
      t.integer :scientist_id
      t.integer :theorem_id
      t.integer :area_id
      t.integer :subject_id
      t.string :created_by

      t.timestamps
    end
  end
end
