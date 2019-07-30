# frozen_string_literal: true

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def owns?(band_name)
    id == band_name.owner.id
  end

  class << self
    def find_or_create_by_google_oauth2(auth)
      find_or_create_by(email: auth.info.email, name: auth.info.name, provider: :google)
    end
  end
end
