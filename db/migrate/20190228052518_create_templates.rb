class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string :question1,              null: false
      t.string :question2,              null: false
      t.string :question3,              null: false
      t.string :question4,              null: false
      t.string :question5,              null: false
      t.references :user,               foreign_key: true
      t.timestamps
    end
  end
end
