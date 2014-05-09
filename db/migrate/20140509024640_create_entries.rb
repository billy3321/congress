class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.integer :category_id
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
