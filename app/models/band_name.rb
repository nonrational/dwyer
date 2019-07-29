class BandName < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :user

  def owner
    user
  end
end
