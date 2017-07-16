class AddBackgroundLinkToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :background_link, :string
  end
end
