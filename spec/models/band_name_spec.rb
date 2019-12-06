# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BandName do
  subject { BandName.new(user: User.new) }

  describe "#valid?" do
    subject { BandName.new }

    it { expect(subject).not_to be_valid }
  end

  describe '#owner' do
    it { expect(subject.owner).to eq subject.user }
  end
end
