class RemoveActivityFromIcons < ActiveRecord::Migration[6.0]
  def change
    remove_reference :icons, :activity, foreign_key: true
  end
end
