# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BandName do
  subject { BandName.new(user: User.new) }

  describe '#owner' do
    it { expect(subject.owner).to eq subject.user }
  end
end
