# Class for answers to question type contents
class Answer < ApplicationRecord
  belongs_to :content, optional: true

  def to_s
    text
  end
end
