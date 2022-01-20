class AddReportToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :report, null: true, foreign_key: true
  end
end
