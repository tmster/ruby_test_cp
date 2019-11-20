# frozen_string_literal: true

module Parsers
  # Parser of logs based in filesystem
  class FileParser
    # Exception to easily show wrong path
    class FileNotFounnd < RuntimeError; end

    def call(filename)
      raise FileNotFounnd unless File.exist? filename

      generate_contents(filename)
    end

    private

    def generate_contents(filename)
      lines = IO.readlines(filename)

      lines.each_with_object({}) do |line, content|
        key, value = line.split.take(2)
        content[key] = [] unless content[key]
        content[key] << value
      end
    end
  end
end
