# frozen_string_literal: true

class Reminder < ApplicationRecord
  belongs_to :user
  has_rich_text :body
end
