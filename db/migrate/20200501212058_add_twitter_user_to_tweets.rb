class AddTwitterUserToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :twitter_user, :integer
  end
end
