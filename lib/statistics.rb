# frozen_string_literal: true

# Represents calculated metrics of file
class Statistics
  attr_reader :content
  def initialize(content)
    @content = content
  end

  def views
    content.map { |key, row| [key, row.count] }.sort_by(&:last).to_h
  end

  def uniq_views
    content.map { |key, row| [key, row.uniq.count] }.sort_by(&:last).to_h
  end
end
