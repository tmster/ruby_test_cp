#!/usr/bin/env ruby
# frozen_string_literal: true

require __dir__ + '/lib/program'

if ARGV.count.zero? && ARGV[0].nil?
  puts 'Usage: parser.rb file_to_parse'
  return 0
end

Program.new.start(ARGV[0])
