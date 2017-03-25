class AddContentsToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :content, foreign_key: true, index: true
  end
end
