class Respondent < ApplicationRecord
  belongs_to :profile
  has_one :answer
end
