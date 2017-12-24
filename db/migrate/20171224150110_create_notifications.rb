class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :ip, null: false
      t.integer :count, null: false, default: 0

      t.timestamps
    end
  end
end
