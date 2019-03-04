class AddProfilesIdToRespondents < ActiveRecord::Migration[5.2]
  def change
    add_reference :respondents, :profile, foreign_key: true
  end
end
