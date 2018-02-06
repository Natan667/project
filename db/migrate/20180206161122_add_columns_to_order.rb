class AddColumnsToOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :name, :string
  	add_column :orders, :car, :string
  	add_column :orders, :get, :boolean, default: false
  end
end
