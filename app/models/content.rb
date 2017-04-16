class Content < ApplicationRecord
  has_one :next
  has_many :answers, inverse_of: :content
  #has_many :answers
  accepts_nested_attributes_for :answers

  validates :key, presence: true

  enum category: [
    :question,
    :explanation
  ]

  enum section: [
    :introduction,
    :number_system,
    :geometry
  ]

  def to_s
    key
  end
end
