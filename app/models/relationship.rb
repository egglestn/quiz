class Relationship < ApplicationRecord
  belongs_to :content, foreign_key: :from_content
  belongs_to :content, foreign_key: :to_content
end
