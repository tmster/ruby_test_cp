# frozen_string_literal: true

RSpec.describe 'parser.rb' do
  describe 'wrong argument' do
    it 'returns correct message' do
      expect { system %(./parser.rb) }
        .to output("Usage: parser.rb file_to_parse\n")
        .to_stdout_from_any_process
    end
  end

  describe 'correct argument' do
    it 'returns correct message' do
      expect { system %(./parser.rb spec/support/dummy_file) }
        .to output(<<~HEREDOC)
          List of webpages:
          PATH                COUNT
          List of uniq views:
          PATH                COUNT
        HEREDOC
        .to_stdout_from_any_process
    end
  end
end
