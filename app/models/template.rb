class Template < ApplicationRecord
  belongs_to :user
  has_many :profiles
  has_one :questions

  def to_key
    [Base64.encode64(id.to_s)]
  end

  def to_param
    Base64.encode64(id.to_s)
  end
end
