class AddBodyCipertextToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :body_ciphertext, :text

    # blind index
    add_column :messages, :body_bidx, :text
    add_index :messages, :body_bidx
    remove_column :messages, :body
  end
end
