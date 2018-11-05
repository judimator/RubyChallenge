class RegistrationController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    super
  end

  def create
    super
  end

  protected
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, :email, :password, :password_confirmation)
    end

    def after_sign_up_path_for(resource)
      super(resource)
      redirect_to login_path
    end

end
