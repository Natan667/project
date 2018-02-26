class AddColumnsToDetailsTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :details, :producer, :string
  	add_column :details, :original_num, :string
  	add_column :details, :series_num, :string
  	add_column :details, :in_price, :string
  	add_column :details, :sel_price, :string
  end
end
