class RemoveReportFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :report, foreign_key: true
  end
end
