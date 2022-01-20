class AddColorToIcons < ActiveRecord::Migration[6.0]
  def change
    add_column :icons, :color, :string
  end
end
