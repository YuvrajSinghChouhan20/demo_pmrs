class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :mobile, :city, :zip, ])
  end
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # redirect_to admin_dashboard_path id resource()
    super(resource)
  end
end
