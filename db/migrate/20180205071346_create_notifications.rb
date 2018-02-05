class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|

      	t.string "description"
	    t.integer "author_id"
	    t.integer "recipient_id"
	    t.string "event"
	    t.timestamps
    end
  end
end
