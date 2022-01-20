class AddTwitterusernameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :twitter_username, :string
  end
end
