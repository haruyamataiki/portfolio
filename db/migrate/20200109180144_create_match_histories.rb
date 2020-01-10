class CreateMatchHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :match_histories do |t|
      t.integer "win"
      t.integer "lose"
      t.integer "draw"
      t.timestamps
    end
  end
end
