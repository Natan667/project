class RenameColumnOrderTable < ActiveRecord::Migration[5.1]
  def change
  	remove_column :orders, :get
  	add_column :orders, :status, :string
  end
end
