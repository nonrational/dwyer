# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @admin = Admin.from_google(auth)

    if @admin&.persisted?
      flash.now[:info] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect @admin, event: :authentication
    else
      flash.now[:error] = "#{auth.info.email} is not authorized."
      redirect_to new_session_url
    end
  end

  def auth
    @auth ||= request.env["omniauth.auth"]
  end
end
