# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating SpongeBob meme', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'makes it possible to create accounts through Facebook' do
    visit spongebob_meme_maker_path
    fill_in 'What should SpongeBob say?', with: 'SpongeBob meme'
    click_on 'CREATE MEME'
    expect(page).to have_text('SpongeBob meme'.spongebobify)
  end
end
