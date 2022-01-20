class RemoveRatingFromActivity < ActiveRecord::Migration[6.0]
  def change

    remove_column :activities, :rating, :integer
  end
end
