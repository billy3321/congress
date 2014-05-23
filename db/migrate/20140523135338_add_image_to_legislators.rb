class AddImageToLegislators < ActiveRecord::Migration
  def change
  	add_column :legislators, :image, :string
  end
end
