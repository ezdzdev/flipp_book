#!/usr/bin/env ruby

require 'rubygems'
require 'rails/commands/runner'
require 'nokogiri'

# Create seeds from own db

# XXX fuck the seeds
File.open('db/seeds.rb', 'wb+') do |f|
  # Profiles
  file_str = "Profile.create(#{Profile.all.as_json.to_s}"
  f.write(file_str)
end

