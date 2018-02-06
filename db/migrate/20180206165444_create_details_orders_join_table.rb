class CreateDetailsOrdersJoinTable < ActiveRecord::Migration[5.1]
  def change
  	  create_join_table :details, :orders
  end
end
