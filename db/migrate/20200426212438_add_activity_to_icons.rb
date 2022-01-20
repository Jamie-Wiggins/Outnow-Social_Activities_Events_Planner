class AddActivityToIcons < ActiveRecord::Migration[6.0]
  def change
    add_reference :icons, :activity, foreign_key: true
  end
end
