class RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js

  protected

    def after_update_path_for(resource)
      user_path(current_user)
    end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  private

    def sign_up_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :biography)
    end

    def account_update_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :current_password, :biography, :avatar)
    end

end
