# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reminders/edit', type: :view do
  before do
    @user = User.create!(first_name: 'MyString', last_name: 'Me', email: 'MyString@mystring.com', password: 'password1')
    @reminder = assign(:reminder, Reminder.create!(
                                    reminder: 'MyText',
                                    user: @user,
                                    remind_at: Time.now
                                  ))
  end

  it 'renders the edit reminder form' do
    render

    assert_select 'form[action=?][method=?]', reminder_path(@reminder), 'post' do
      assert_select 'textarea[name=?]', 'reminder[reminder]'
    end
  end
end
