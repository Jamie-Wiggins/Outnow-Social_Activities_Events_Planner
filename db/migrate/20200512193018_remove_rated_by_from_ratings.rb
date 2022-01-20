class RemoveRatedByFromRatings < ActiveRecord::Migration[6.0]
  def change
    remove_column :ratings, :rated_by, :string
  end
end
