class AddHostToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :host, :string
  end
end
