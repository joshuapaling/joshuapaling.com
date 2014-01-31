class MyDeviseController < ApplicationController

  layout :layout

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) ||
      case resource_or_scope.class.name
      when "User"
        admin_root_path
      else
        super
      end
  end

  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
    when :user
      new_user_session_path
    end
  end

  def signed_in_root_path(resource)
    case resource.class.name
    when "User"
      admin_root_path
    else
      super
    end
  end

  private

    def layout
      if devise_controller? && devise_mapping.name == :user
        'admin'
      else
        'layouts/application'
      end
    end
end
