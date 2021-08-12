require 'rails_helper'

RSpec.describe "reminders/edit", type: :view do
  before(:each) do
    @reminder = assign(:reminder, Reminder.create!(
      reminder: "MyText",
      users: nil
    ))
  end

  it "renders the edit reminder form" do
    render

    assert_select "form[action=?][method=?]", reminder_path(@reminder), "post" do

      assert_select "textarea[name=?]", "reminder[reminder]"

      assert_select "input[name=?]", "reminder[users_id]"
    end
  end
end
