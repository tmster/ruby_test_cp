# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

require __dir__ + '/output'
require __dir__ + '/parsers/file_parser'
require __dir__ + '/statistics'
require __dir__ + '/program'
require __dir__ + '/formatters/cli_formatter'
require __dir__ + '/languages/base'
require __dir__ + '/languages/english'
require __dir__ + '/runner'

# Starting point for application
class Program
  attr_reader :config

  def initialize(config = {})
    @config = {
      default_lang: Languages::English.new,
      formatter: Formatters::CliFormatter.new,
      parser: Parsers::FileParser.new
    }.merge(config)
  end

  def start(filename)
    Runner.new(config).call(filename)
  end
end
