class CreateTeamRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :team_relationships do |t|
		t.references :follower
		t.references :followed

      t.timestamps
    end
  end
end
