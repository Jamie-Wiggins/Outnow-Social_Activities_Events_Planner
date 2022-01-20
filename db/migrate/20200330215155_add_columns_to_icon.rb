class AddColumnsToIcon < ActiveRecord::Migration[6.0]
  def change
    add_column :icons, :fasRef, :text
    add_column :icons, :sizeRef, :string
    add_column :icons, :conSizeRef, :text
  end
end
