# frozen_string_literal: true

RSpec.describe Statistics do
  let(:content) do
    { '/root' => %w[1 2 3], '/test' => ['1'], '/long' => %w[1 2 2 2] }
  end

  describe '#views' do
    subject { described_class.new(content).views }

    context 'when content is empty' do
      let(:content) { {} }

      it do
        is_expected.to eq({})
      end
    end

    it { is_expected.to eq('/long' => 4, '/root' => 3, '/test' => 1) }
  end

  describe '#uniq_views' do
    subject { described_class.new(content).uniq_views }

    context 'when content is empty' do
      let(:content) { {} }

      it do
        is_expected.to eq({})
      end
    end

    it { is_expected.to eq('/root' => 3, '/long' => 2, '/test' => 1) }
  end
end
