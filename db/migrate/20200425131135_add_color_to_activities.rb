class AddColorToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :color, :string
  end
end
