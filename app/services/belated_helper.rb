# frozen_string_literal: true

class BelatedHelper
  def self.client
    @client ||= Belated::Client.new
  end
end
