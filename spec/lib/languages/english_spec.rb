# frozen_string_literal: true

require 'tempfile'

RSpec.describe Languages::English do
  it { expect(described_class).to be < Languages::Base }
  describe 'initializr settings' do
    subject { described_class.new }
    it { expect(subject.language_name).to eq 'en' }
  end
end
