class Respondent < ApplicationRecord
  belongs_to :profile
  has_one :answer
  mount_uploader :image, MessageImageUploader
  enum kind: [:"私", :"ぼく", :"俺", :"あたし"]
  attr_writer :year, :month, :day
  before_validation :set_birthday
  validates :name, presence: true

  def set_birthday
    self.birthday = [@year, @month,@day].join(",")
  end
end
