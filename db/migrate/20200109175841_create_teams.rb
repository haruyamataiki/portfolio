class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string "name"
      t.string "team_image_id"
      t.integer "team_score"
      t.timestamps
    end
  end
end
