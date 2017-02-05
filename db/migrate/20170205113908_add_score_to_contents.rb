class AddScoreToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :score, :integer
  end
end
