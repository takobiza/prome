class AddRespondentToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :respondents, :image, :string
  end
end
