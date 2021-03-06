# frozen_string_literal: true

class CreateCounters < ActiveRecord::Migration[7.0]
  def change
    create_table :counters do |t|
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
