# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Counter, type: :model do
  it 'has a count field with default value' do
    expect(described_class.new.count).to eq 0
  end
end
