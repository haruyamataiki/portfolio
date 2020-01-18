class AddTeamToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :team_id, :integer
  end
end
