class AddUsernameToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :username, :string
  end
end
