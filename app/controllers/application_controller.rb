class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys:
      [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day]
    )
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'kuroneko' && password == '4126'
    end
  end
end
