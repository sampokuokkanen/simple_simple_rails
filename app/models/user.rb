# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  def self.from_omniauth(auth)
    auth = OpenStruct.new(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info[:email]
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info[:name] # assuming the user model has a name
      user.last_name = auth.info[:name]
      # user.image = auth.info.image # assuming the user model has an image
      # user.skip_confirmation!
    end
  end
end
