class Respondent < ApplicationRecord
  belongs_to :profile
  has_one :answer
  mount_uploader :image, MessageImageUploader
  enum firstperson: {watashi: 0, ore: 1, boku: 2,atashi: 3}
  attr_writer :year, :month, :day
  before_validation :set_birthday
  validates :name, presence: true
  @sentenceEnder = [["です。","かな。","だよ。","なんだ。","かな。","だよ!"],["だ！","だ。","だ。","だ。","だ!!","だ!"],["です。","かな。","だよ。","なんだ。","かな","だよ!"],["よ!","よ。","よ。","よ。","よ!!","よ!"]];

  attr_accessor :sentenceEnder

  def to_key
    [Base64.encode64(id.to_s)]
  end

  def to_param
    Base64.encode64(id.to_s)
  end

  def set_birthday
    self.birthday = [@year, @month,@day].join(",")
  end

  def self.return_sentence_ender(array_num, value_num)
    return @sentenceEnder[array_num][value_num]
  end
end
