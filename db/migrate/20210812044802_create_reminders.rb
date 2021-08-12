class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.datetime :remind_at
      t.text :reminder
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
