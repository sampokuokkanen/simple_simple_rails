class BelatedHelper
  def self.client
    @client ||= Belated::Client.new
  end
end