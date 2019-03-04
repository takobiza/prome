class Template < ApplicationRecord
  belongs_to :user
  has_many :profiles
  has_one :questions
end
