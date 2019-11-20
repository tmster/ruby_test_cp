# frozen_string_literal: true

RSpec.describe Formatters::CliFormatter do
  let(:context) do
    instance_double('Output',
                    statistics_views: [{ 'A' => 1 }],
                    statistics_uniq_views: [{ 'B' => 2 }])
  end

  before do
    allow(context).to receive(:t).with(any_args) { |arg| arg }
  end

  describe '#output_report' do
    subject { described_class.new.output_report(context) }
    it do
      expect { subject }.to output(<<~HEREDOC).to_stdout
        list_of_webpages
        path                count
        key_value_views
        list_of_uniq_views
        path                count
        key_value_views
      HEREDOC
    end
  end

  describe '#views' do
    subject { described_class.new.views(context) }
    it do
      expect { subject }.to output(<<~HEREDOC).to_stdout
        list_of_webpages
        path                count
        key_value_views
      HEREDOC
    end
  end

  describe '#uniq_views' do
    subject { described_class.new.uniq_views(context) }
    it do
      expect { subject }.to output(<<~HEREDOC).to_stdout
        list_of_uniq_views
        path                count
        key_value_views
      HEREDOC
    end
  end

  describe '#header' do
    subject { described_class.new.header(context) }
    it do
      expect { subject }.to output(<<~HEREDOC).to_stdout
        path                count
      HEREDOC
    end
  end
end
