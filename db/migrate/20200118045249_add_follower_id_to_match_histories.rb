class AddFollowerIdToMatchHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :match_histories, :follower_id, :integer
  end
end
