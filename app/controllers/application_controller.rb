class ApplicationController < ActionController::Base
  private
    def after_sign_out_path_for(resource)
      login_path
    end

end
