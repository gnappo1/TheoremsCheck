class RemoveEraFromScientists < ActiveRecord::Migration[5.0]
  def change
    remove_column :scientists, :era, :integer
  end
end
