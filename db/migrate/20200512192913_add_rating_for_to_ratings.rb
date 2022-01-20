class AddRatingForToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :rating_for, :integer
  end
end
