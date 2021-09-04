# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Oauth login', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'makes it possible to create accounts through Facebook' do
    visit new_user_session_path
    click_link 'Sign in with Facebook'
    expect(page).to have_text('Successfully authenticated from Facebook account')
  end
end
