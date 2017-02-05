class Content < ApplicationRecord
  belongs_to :content, optional: true
  has_many :contents

  enum category: [
    :question,
    :answer,
    :explanation
  ]

  enum section: [
    :world_without_maths,
    :number_system,
    :geometry
  ]
end
