class RemoveColumnFromScientists < ActiveRecord::Migration[5.0]
  def change
    remove_column :scientists, :gender
  end
end
