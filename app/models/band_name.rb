class BandName < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  belongs_to :user

  def owner
    user
  end

end
