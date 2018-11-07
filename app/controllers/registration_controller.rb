# frozen_string_literal: true

class RegistrationController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  protected

  def after_sign_up_path_for(_resource)
    login_path
  end
end
