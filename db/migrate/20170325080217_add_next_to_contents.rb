class AddNextToContents < ActiveRecord::Migration[5.0]
  def change
    add_reference :contents, :next, index: true
  end
end
