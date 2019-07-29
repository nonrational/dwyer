# frozen_string_literal: true

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def owns?(band_name)
    id == band_name.owner.id
  end

  class << self
    def from_google(auth)
      find_or_create_by(email: email, full_name: auth.info.name, provider: "Google")
    end
  end
end
