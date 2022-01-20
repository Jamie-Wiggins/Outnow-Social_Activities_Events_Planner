class RemoveStopListFromTweets < ActiveRecord::Migration[6.0]
  def change

    remove_column :tweets, :stop_list, :text
  end
end
