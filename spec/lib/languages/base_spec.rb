# frozen_string_literal: true

RSpec.describe Languages::Base do
  let(:file_name) { 'spec/support/test_lang.yml' }
  let(:language) { :test }

  describe '#translate' do
    context 'when wrong key name' do
      subject { described_class.new(language, file_name).translate('nothing') }
      it 'throws an exception' do
        expect do
          subject
        end.to raise_error(Languages::Base::KeyNotFound)
      end
    end

    context 'when key exists' do
      subject { described_class.new(language, file_name).translate('key') }

      context 'when parametrized value' do
        subject do
          described_class.new(language, file_name)
                         .translate('params', value: 'Awesome!')
        end

        it { is_expected.to eq('value: Awesome!') }
      end

      it { is_expected.to eq('Key') }
    end
  end

  describe '#config' do
    subject { described_class.new(language, file_name).config }

    context 'when wrong file' do
      let(:file_name) { 'spec/nothing' }
      it do
        expect do
          subject
        end.to raise_error(Errno::ENOENT)
      end
    end

    context 'when wrong language' do
      let(:language) { :empty }
      it { is_expected.to eq({}) }
    end

    it {
      is_expected
        .to eq('key' => 'Key', 'params' => 'value: %<value>s')
    }
  end
end
