class Answer < ApplicationRecord
  belongs_to :content

  def to_s
    text
  end
end
