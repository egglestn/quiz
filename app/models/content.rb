class Content < ApplicationRecord
  has_one :next
  has_many :answers

  enum category: [
    :question,
    :explanation
  ]

  enum section: [
    :world_without_maths,
    :number_system,
    :geometry
  ]

  def to_s
    key
  end
end
