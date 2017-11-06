class CreateJoinTableUsersScientists < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :scientists do |t|
      t.index [:user_id, :scientist_id]
      t.index [:scientist_id, :user_id]
    end
  end
end
