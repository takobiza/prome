class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer1,                  null: false
      t.string :answer2,                  null: false
      t.string :answer3,                  null: false
      t.string :answer4,                  null: false
      t.string :answer5,                  null: false
      t.references :respondent,           foreign_key: true
      t.timestamps
    end
  end
end

