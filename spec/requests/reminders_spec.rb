# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/reminders', type: :request do
  # Reminder. As you add validations to Reminder, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { reminder: 'Hello world', remind_at: Time.now + 1.day }
  end

  let(:invalid_attributes) do
    { reminder: 'Hello world', remind_at: nil }
  end

  let(:user) { User.create(first_name: 'MyString', last_name: 'Me', email: 'MyString@mystring.com', password: 'password1') }
  let(:second_user) { User.create!(first_name: 'MyString', last_name: 'Me', email: 'MyMy@mymy.com', password: 'hellohello') }
  let(:second_reminder) { Reminder.create!(user_id: second_user.id, reminder: 'Hello world', remind_at: Time.now + 1.day) }

  before do
    login_as(user)
    Belated::Testing.test_mode_off!
    @worker = Thread.new {
      b = Belated.instance
      b.start
    }
  end

  after do
    Belated::Testing.inline!
    @worker.kill
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Reminder.create! valid_attributes.merge({user_id: user.id})
      get reminders_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      reminder = Reminder.create! valid_attributes.merge({user_id: user.id})
      get reminder_url(reminder)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_reminder_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      reminder = Reminder.create! valid_attributes.merge({user_id: user.id})
      get edit_reminder_url(reminder)
      expect(response).to be_successful
    end

    it "is not possible to edit other people's reminders" do
      get edit_reminder_url(second_reminder)
      expect(response.status).to eq 404
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Reminder' do
        expect {
          post reminders_url, params: { reminder: valid_attributes }
        }.to change(Reminder, :count).by(1)
        expect(Reminder.last.user_id).to eq(user.id)
      end

      it 'creates a new Reminder' do
        post reminders_url, params: { reminder: valid_attributes.merge({remind_at: Time.now + 10}) }
        post reminders_url, params: { reminder: valid_attributes.merge({remind_at: Time.now + 10}) }
        post reminders_url, params: { reminder: valid_attributes.merge({remind_at: Time.now + 10}) }
        
        expect {
          post reminders_url, params: { reminder: valid_attributes.merge({remind_at: Time.now}) }
          sleep 2
        }.to change(ActionMailer::Base.deliveries, :count).by(1)
      end

      it 'redirects to the created reminder' do
        post reminders_url, params: { reminder: valid_attributes }
        expect(response).to redirect_to(reminder_url(Reminder.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Reminder' do
        expect {
          post reminders_url, params: { reminder: invalid_attributes }
        }.to change(Reminder, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post reminders_url, params: { reminder: invalid_attributes }
        expect(response.status).to eq 422
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:time) { Time.now + 1.hour }
      let(:new_attributes) do
        { remind_at: time }
      end

      it 'updates the requested reminder' do
        reminder = Reminder.create! valid_attributes.merge({user_id: user.id})
        patch reminder_url(reminder), params: { reminder: new_attributes }
        reminder.reload
        expect(reminder.remind_at).to be_within(1.second).of time
      end

      it 'redirects to the reminder' do
        reminder = Reminder.create! valid_attributes.merge({user_id: user.id})
        patch reminder_url(reminder), params: { reminder: new_attributes }
        reminder.reload
        expect(response).to redirect_to(reminder_url(reminder))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        reminder = Reminder.create! valid_attributes.merge({user_id: user.id})
        patch reminder_url(reminder), params: { reminder: invalid_attributes }
        expect(response.status).to eq 422
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested reminder' do
      reminder = Reminder.create! valid_attributes.merge({user_id: user.id})
      expect {
        delete reminder_url(reminder)
      }.to change(Reminder, :count).by(-1)
    end

    it 'redirects to the reminders list' do
      reminder = Reminder.create! valid_attributes.merge({user_id: user.id})
      delete reminder_url(reminder)
      expect(response).to redirect_to(reminders_url)
    end
  end
end
