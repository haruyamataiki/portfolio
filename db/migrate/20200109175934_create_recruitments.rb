class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.text "title"
      t.text "body"
      t.string "category"
      t.string "score"
      t.datetime "date"
      t.string "spot"

      t.timestamps
    end
  end
end
