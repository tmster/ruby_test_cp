# frozen_string_literal: true

# Represents responsibility of the output of the program
class Output
  def initialize(statistics = nil,
                 language: Languages::English.new,
                 formatter: Formatters::CliFormatter.new)
    @statistics = statistics
    @language = language
    @formatter = formatter
  end

  def call
    @formatter.output_report(self)
  end

  def t(key, opts = {})
    @language.translate(key, opts)
  end

  def statistics_views
    @statistics.views
  end

  def statistics_uniq_views
    @statistics.uniq_views
  end
end
