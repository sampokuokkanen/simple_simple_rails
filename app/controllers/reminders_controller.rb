# frozen_string_literal: true

class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[show edit update destroy]

  # GET /reminders
  def index
    @reminders = Reminder.all
  end

  # GET /reminders/1
  def show; end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
  end

  # GET /reminders/1/edit
  def edit; end

  # POST /reminders
  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.user = current_user
    if @reminder.save
      redirect_to @reminder, notice: 'Reminder was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reminders/1
  def update
    if @reminder.update(reminder_params)
      redirect_to @reminder, notice: 'Reminder was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reminders/1
  def destroy
    @reminder.destroy
    redirect_to reminders_url, notice: 'Reminder was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reminder
    @reminder = Reminder.find(params[:id])
    authorize unless action_name == 'show'
  end

  def authorize
    return if current_user.id == @reminder.user_id

    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def reminder_params
    params.require(:reminder).permit(:remind_at, :reminder, :users_id)
  end
end
