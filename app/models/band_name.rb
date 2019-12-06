# frozen_string_literal: true

class BandName < ApplicationRecord
  validates :user, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :user

  alias_attribute :owner, :user
end
