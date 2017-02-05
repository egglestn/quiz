class AddCategoryToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :category, :integer
  end
end
