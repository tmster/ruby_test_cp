# frozen_string_literal: true

require 'yaml'

module Languages
  # Base class for languages
  class Base
    # Exception for non existend key in languagr
    class KeyNotFound < RuntimeError; end

    DEFAULT_FILENAME = 'languages.yml'

    attr_reader :language_name, :file_name

    def initialize(language_name = nil, file_name = DEFAULT_FILENAME)
      @language_name = language_name.to_s
      @file_name = file_name
    end

    def translate(key, opts = {})
      config_entry = config[key]
      raise KeyNotFound, "Key: '#{key}' not found" unless config_entry

      config_entry % opts
    end

    def config
      @config ||= config_for_language
    end

    def config_for_language
      config_for_language = YAML.safe_load(file_contents)[language_name]
      config_for_language || {}
    end

    private

    def file_contents
      File.read(file_name)
    end
  end
end
