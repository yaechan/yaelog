class CreateCategoriesEntries < ActiveRecord::Migration
  def change
    create_table :categories_entries do |t|
      t.integer :category_id
      t.integer :entry_id
    end
  end
end
