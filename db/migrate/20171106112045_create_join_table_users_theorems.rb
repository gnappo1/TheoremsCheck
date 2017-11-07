class CreateJoinTableUsersTheorems < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :theorems do |t|
      t.index [:user_id, :theorem_id]
      t.index [:theorem_id, :user_id]
    end
  end
end
