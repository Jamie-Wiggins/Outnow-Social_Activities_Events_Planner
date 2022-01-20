class AddUserTagsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_tags, :text
  end
end
