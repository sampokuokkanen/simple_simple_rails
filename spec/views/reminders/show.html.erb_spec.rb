# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reminders/show', type: :view do
  before do
    @user = User.create!(first_name: 'MyString', last_name: 'Me', email: 'MyString@mystring.com', password: 'password1')
    @reminder = assign(:reminder, Reminder.create!(
                                    reminder: 'MyText',
                                    user_id: @user.id,
                                    remind_at: Time.now
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
