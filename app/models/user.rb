# frozen_string_literal: true

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  alias_attribute :image_url, :image

  def owns?(band_name)
    id == band_name.owner.id
  end

  class << self
    def find_or_create_by_google_oauth2(auth)
      find_or_initialize_by(email: auth.info.email, provider: :google) do |user|
        user.update!(name: auth.info.name, image_url: auth.info.image)
      end
    end
  end
end
