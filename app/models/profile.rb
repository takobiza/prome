class Profile < ApplicationRecord
  has_one :respondent, dependent: :destroy
  belongs_to :template

end
