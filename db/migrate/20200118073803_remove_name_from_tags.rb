class RemoveNameFromTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :name, :integer
  end
end
