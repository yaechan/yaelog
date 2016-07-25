class RemoveCategoryFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :category
  end
end
