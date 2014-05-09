class CreateEntriesLegislators < ActiveRecord::Migration
  def change
  	create_table :entries_legislators do |t|
      t.integer :entry_id
      t.integer :legislator_id  
    end
  end
end
