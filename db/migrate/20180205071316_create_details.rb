class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|

      t.string "title"
	  t.text "description"
	  t.integer "author_id"
      t.timestamps
    end
  end
end
