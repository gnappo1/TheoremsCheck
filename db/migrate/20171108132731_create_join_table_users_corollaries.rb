class CreateJoinTableUsersCorollaries < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :corollaries do |t|
      t.index [:user_id, :corollary_id]
      t.index [:corollary_id, :user_id]
    end
  end
end
