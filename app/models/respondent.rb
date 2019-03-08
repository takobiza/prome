class Respondent < ApplicationRecord
  belongs_to :profile
  has_one :answer
  mount_uploader :image, MessageImageUploader
  enum firstperson: {watashi: 0, ore: 1, boku: 2,atashi: 3}
  attr_writer :year, :month, :day
  before_validation :set_birthday
  validates :name, presence: true

  def set_birthday
    self.birthday = [@year, @month,@day].join(",")
  end
end
