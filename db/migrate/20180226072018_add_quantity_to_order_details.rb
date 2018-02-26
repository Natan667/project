class AddQuantityToOrderDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :details_quantity, :integer
  end
end
