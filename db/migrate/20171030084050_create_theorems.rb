class CreateTheorems < ActiveRecord::Migration[5.0]
  def change
    create_table :theorems do |t|
      t.string :name
      t.text :statement
      t.text :demonstration
      t.integer :scientist_id
      t.integer :area_id
      t.timestamps
    end
  end
end
