class CreateRandomNames < ActiveRecord::Migration[6.0]
  def change
    create_table :random_names do |t|
      t.string :username

      t.timestamps
    end
  end
end
