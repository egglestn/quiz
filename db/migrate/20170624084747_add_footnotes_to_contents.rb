class AddFootnotesToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :footnotes, :string
  end
end
