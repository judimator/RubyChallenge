# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def after_sign_out_path_for(_resource)
    login_path
  end
end
