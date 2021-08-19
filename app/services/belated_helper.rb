# frozen_string_literal: true

class BelatedHelper
  def self.client
    return @client if @client

    client = Belated::Client.instance
    client.start unless client.started?
    @client = client
  end
end
