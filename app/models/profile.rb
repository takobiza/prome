class Profile < ApplicationRecord
  has_many :respondents
  belongs_to :template
end
