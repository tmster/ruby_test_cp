# frozen_string_literal: true

module Formatters
  # Output formatter for cli interface
  class CliFormatter
    def output_report(context)
      views(context)
      uniq_views(context)
    end

    def views(context)
      puts context.t('list_of_webpages')
      header(context)
      context.statistics_views.each do |key, value|
        puts context.t('key_value_views', key: key, value: value)
      end
    end

    def uniq_views(context)
      puts context.t('list_of_uniq_views')
      header(context)
      context.statistics_uniq_views.each do |key, value|
        puts context.t('key_value_views', key: key, value: value)
      end
    end

    def header(context)
      puts context.t('path') + (' ' * 16) + context.t('count')
    end
  end
end
