# frozen_string_literal: true

# Responsible for initializing calls between program parts
class Runner
  def initialize(default_lang:, formatter:, parser:)
    @default_lang = default_lang
    @formatter = formatter
    @parser = parser
  end

  def call(filename)
    data = Statistics.new(@parser.call(filename))
    Output.new(data, language: @default_lang, formatter: @formatter).call
  end
end
