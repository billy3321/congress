class AddAbbreviationToParties < ActiveRecord::Migration
  def change
  	add_column :parties, :abbreviation, :string
  end
end
