require 'rails_helper'

RSpec.describe "reminders/index", type: :view do
  before(:each) do
    @user = User.create!(first_name: "MyString", last_name: 'Me', email: "MyString@mystring.com", password: 'password1')
    assign(:reminders, [
      Reminder.create!(
        reminder: "MyText",
        user: @user
      ),
      Reminder.create!(
        reminder: "MyText",
        user: @user
      )
    ])
  end

  it "renders a list of reminders" do
    render
    assert_select "span", text: "MyText", count: 2
  end
end
