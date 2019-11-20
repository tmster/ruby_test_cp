# frozen_string_literal: true

require 'tempfile'

RSpec.describe Parsers::FileParser do
  let(:file) { Tempfile.new('file') }
  let(:filename) { file.path }

  describe '#call' do
    subject { described_class.new.call(filename) }

    context 'when wrong file name' do
      let(:filename) { 'wrong_path' }
      it 'throws an exception' do
        expect do
          subject
        end.to raise_error(Parsers::FileParser::FileNotFounnd)
      end
    end

    context 'when file exists' do
      let(:content) do
        "/root 1.1.1.1\n/root 2.2.2.2\n/home 1.1.1.1\n"
      end

      before do
        file.write(content)
        file.rewind
      end

      context 'when wrong file structure' do
        let(:content) { 'very long string in one line' }

        it { is_expected.to eq('very' => ['long']) }
      end

      it {
        is_expected.to eq('/root' => ['1.1.1.1', '2.2.2.2'],
                          '/home' => ['1.1.1.1'])
      }
    end
  end
end
