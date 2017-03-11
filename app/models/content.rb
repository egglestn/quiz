class Content < ApplicationRecord
  has_many :relationships, foreign_key: :from_content
  has_many :contents, through: :relationships

  accepts_nested_attributes_for :relationships

  enum category: [
    :answer,
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
