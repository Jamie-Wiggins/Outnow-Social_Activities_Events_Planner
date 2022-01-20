class AddStopListToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :stop_list, :text
  end
end
