require 'rails_helper'

RSpec.describe Counter, type: :model do
  it 'has a count field with default value' do
    expect(Counter.new.count).to eq 0
  end
end
