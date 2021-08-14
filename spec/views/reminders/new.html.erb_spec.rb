# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reminders/new', type: :view do
  before do
    @user = User.create!(first_name: 'MyString', last_name: 'Me', email: 'MyString@mystring.com', password: 'password1')
    assign(:reminder, Reminder.new(
                        reminder: 'MyText',
                        user: @user
                      ))
  end

  it 'renders new reminder form' do
    render

    assert_select 'form[action=?][method=?]', reminders_path, 'post' do
      assert_select 'textarea[name=?]', 'reminder[reminder]'
    end
  end
end
