class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :name
      t.integer :party_id
      t.text :description
      t.string :constituency

      t.timestamps
    end
  end
end
