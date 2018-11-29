# frozen_string_literal: true
require('devise')

class RegistrationsController < Devise::RegistrationsController
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable,
       :validatable, authentication_keys: [:login, :sign_up]
end
