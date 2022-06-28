class ApplicationController < ActionController::Base

   before_action :authenticate_various_user, except: [:top]
  def authenticate_various_user

    if request.path.starts_with?('/admin')
      authenticate_admin!
    else
      authenticate_customer!
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
end
