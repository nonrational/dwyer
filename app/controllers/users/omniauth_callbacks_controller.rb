# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_or_create_by_google_oauth2(auth)

    if @user.persisted?
      flash.now[:info] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect @user, event: :authentication
    else
      flash.now[:error] = "#{auth.info.email} is not authorized."
      redirect_to new_session_url
    end
  end

  def auth
    @auth ||= request.env["omniauth.auth"]
  end
end
