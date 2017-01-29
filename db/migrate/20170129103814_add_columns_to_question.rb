class AddColumnsToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :prev, :integer
    add_column :questions, :next, :integer
  end
end
