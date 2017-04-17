class Answer < ApplicationRecord
  belongs_to :content, optional: true

  def to_s
    text
  end
end
