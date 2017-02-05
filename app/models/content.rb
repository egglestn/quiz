class Content < ApplicationRecord
  belongs_to :content, optional: true
  has_many :contents

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
