# frozen_string_literal: true

RSpec.describe Output do
  let(:statistics) { instance_double('Statistics') }

  describe '#call' do
    let(:formatter) { instance_double('AnyFormatter') }
    subject { described_class.new(statistics, formatter: formatter) }

    it 'runs formatter with data' do
      response = double
      expect(formatter)
        .to receive(:output_report)
        .with(subject)
        .and_return(response)
      expect(subject.call).to eq response
    end
  end

  describe '#t' do
    let(:language) { instance_double('AnyLanguage') }
    let(:key) { 'test_key' }
    let(:opts) { { opt: '2' } }

    subject do
      described_class.new(statistics, language: language).t(key, opts)
    end

    it 'translates key supplemented by options' do
      response = double
      expect(language)
        .to receive(:translate)
        .with(key, opts)
        .and_return(response)
      is_expected.to eq response
    end
  end

  describe '#statistics_views' do
    let(:views_count) { 15 }
    before do
      expect(statistics)
        .to receive(:views)
        .and_return(views_count)
    end

    subject do
      described_class.new(statistics).statistics_views
    end

    it { is_expected.to eq views_count }
  end

  describe '#statistics_uniq_views' do
    let(:uniq_views_count) { 15 }
    before do
      expect(statistics)
        .to receive(:uniq_views)
        .and_return(uniq_views_count)
    end

    subject do
      described_class.new(statistics).statistics_uniq_views
    end

    it { is_expected.to eq uniq_views_count }
  end
end
