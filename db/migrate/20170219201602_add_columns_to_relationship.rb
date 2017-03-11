class AddColumnsToRelationship < ActiveRecord::Migration[5.0]
  def change
     add_column :relationships, :from_content, :integer
     add_column :relationships, :to_content, :integer
  end
end
