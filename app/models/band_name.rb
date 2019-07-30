class BandName < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :user

  alias_attribute :owner, :user
end
