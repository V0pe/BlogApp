class ApplicationController < ActionController::Base
  helper_method :user_data
  helper_method :user_posts
  helper_method :current_user
  def user_data
    @user_data ||= User.all
  end

  def user_posts
    @user_posts ||= Post.all
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :encrypted_password)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
