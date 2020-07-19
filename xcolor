#!/usr/bin/env ruby


color = ARGV[0]
exit 1 if color.nil?


require 'json'

config_file = File.join(Dir.home, '.xcolor')

if File.exist?(config_file)
  config = JSON.parse(File.read(config_file))
  match = config.fetch(color, nil) 
  unless match.nil?
    puts match
    exit 0 
  end
end


require 'nokogiri'
require 'open-uri'

config ||= {}

Nokogiri::HTML(open('https://styleguide.lab.explo.org/colors/v2')) \
.search("div.x-#{color}:contains('#')").each do |item|
  match = item.content.scan(/#.*\S/).first
  File.write(config_file, config.merge(color => match).to_json)
  puts match
end
