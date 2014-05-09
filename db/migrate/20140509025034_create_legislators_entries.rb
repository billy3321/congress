class CreateLegislatorsEntries < ActiveRecord::Migration
  def change
  	create_table :legislators_entries do |t|
      t.integer :legislator_id
      t.integer :entry_id
    end
  end
end
