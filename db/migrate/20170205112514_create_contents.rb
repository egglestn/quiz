class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :text
      t.string :key
      t.integer :section
      t.integer :answer_selected
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
