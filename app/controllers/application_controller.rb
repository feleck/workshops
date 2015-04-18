class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  def configure_permited_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:firstname, :lastname]
  end
end
