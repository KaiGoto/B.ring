class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,if: :devise_controller?


def after_sign_in_path_for(resource)
  case resource
  when Admin
    root_path(sort: 0)
  when User
    root_path
  end
end

def after_sign_out_path_for(resource)
  root_path
end



  private
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :k_first_name, :k_last_name, :nickname, :postal_code, :address, :telephone_number])
  end

end
