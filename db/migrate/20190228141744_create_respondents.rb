class CreateRespondents < ActiveRecord::Migration[5.2]
  def change
    create_table :respondents do |t|
      t.string :name,                   null:false
      t.string :height
      t.string :bodyweight
      t.string :profession
      t.integer :firstperson
      t.string :birthday
      t.string :blood
      t.string :sign
      t.string :charmpoint
      t.string :personality
      t.string :skill
      t.string :hobby
      t.string :favoritefood
      t.string :dislikefood
      t.string :dream
      t.string :wish
      t.timestamps
    end
  end
end
