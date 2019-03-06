class Profile < ApplicationRecord
  has_one :respondent
  belongs_to :template
end
