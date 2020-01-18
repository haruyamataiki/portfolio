class AddFollowedIdToMatchHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :match_histories, :followed_id, :integer
  end
end
