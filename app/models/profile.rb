class Profile < ApplicationRecord
  has_one :respondent, dependent: :destroy
  # has_many :respondents, through: :profiles

  belongs_to :template
  def to_key
    [Base64.encode64(id.to_s)]
  end

  def to_param
    Base64.encode64(id.to_s)
  end
end
