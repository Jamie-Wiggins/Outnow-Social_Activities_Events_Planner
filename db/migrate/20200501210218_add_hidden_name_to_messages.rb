class AddHiddenNameToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :hidden_name, :string
  end
end
