class AddTagNameToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :tag_name, :string
  end
end
