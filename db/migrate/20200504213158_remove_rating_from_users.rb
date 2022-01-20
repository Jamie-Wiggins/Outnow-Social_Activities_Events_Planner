class RemoveRatingFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :rating, :integer
  end
end
