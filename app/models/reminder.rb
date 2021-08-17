# frozen_string_literal: true

class Reminder < ApplicationRecord
  belongs_to :user
  validates :reminder, presence: true
  validates :remind_at, presence: true
end
