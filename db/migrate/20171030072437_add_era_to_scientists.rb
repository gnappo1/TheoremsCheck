class AddEraToScientists < ActiveRecord::Migration[5.0]
  def change
    add_column :scientists, :era, :integer
  end
end
