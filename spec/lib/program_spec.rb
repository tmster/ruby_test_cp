# frozen_string_literal: true

RSpec.describe Program do
  subject { described_class.new }

  describe '#initialize' do
    context 'overridable config' do
      let(:config) { { default_lang: 'SomeLang' } }

      subject { described_class.new(config) }

      it do
        expect(subject.config.slice(:default_lang)).to match(
          default_lang: 'SomeLang'
        )
      end
    end

    it do
      expect(subject.config).to match(
        default_lang: be_an_instance_of(Languages::English),
        formatter: be_an_instance_of(Formatters::CliFormatter),
        parser: be_an_instance_of(Parsers::FileParser)
      )
    end
  end

  describe '#start' do
    it do
      expect { subject.start('spec/support/dummy_file') }
        .to output.to_stdout
    end
  end
end
