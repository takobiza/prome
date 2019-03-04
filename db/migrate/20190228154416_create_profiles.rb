class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :respondent,           foreign_key: true
      t.references :template,           foreign_key: true
      t.timestamps
    end
  end
end

