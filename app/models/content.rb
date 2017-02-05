class Content < ApplicationRecord
  belongs_to :content, optional: true
  has_many :contents

  enum category: [
    :question,
    :answer,
    :explanation
  ]
end
