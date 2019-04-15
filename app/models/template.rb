class Template < ApplicationRecord
  belongs_to :user
  has_many :profiles, dependent: :destroy
  has_many :respondents, through: :profiles, dependent: :destroy
  validates :question1, presence: true
  validates :question2, presence: true
  validates :question3, presence: true
  validates :question4, presence: true
  validates :question5, presence: true

  def to_key
    [Base64.encode64(id.to_s)]
  end

  def to_param
    Base64.encode64(id.to_s)
  end
end
