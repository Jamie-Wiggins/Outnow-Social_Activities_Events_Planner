class AddHostRatingToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :host_rating, :integer
  end
end
