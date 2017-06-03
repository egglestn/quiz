# Class with primary live content
class Content < ApplicationRecord
  belongs_to :next, dependent: :destroy, optional: true, class_name: Content
  has_many :answers, dependent: :destroy

  attr_accessor :create_next
  attr_accessor :previous_id
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
