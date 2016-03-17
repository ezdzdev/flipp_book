#!/usr/bin/env ruby

require 'rubygems'
require 'rails/commands/runner'
require 'nokogiri'

# Note to self: run like
# rails runner scripts/extract_from_directory.rb
doc = Nokogiri::HTML(open('./temp_int_dir.html'))

p_elements = doc.css('.profile')

p_elements.each do |p|

  image = p.css('img').first['src'].strip
  name = p.css('span').first.content.strip
  role = p.css('span')[1].content.strip

  phone_number = p.content.match(/\d\d\d-\d\d\d-\d\d\d\d/).to_s
  email = p.content.match(/[a-z\.]*@flipp\.com/).to_s

  profile = Profile.new
  profile.image_url = image
  profile.name = name
  profile.role = role
  profile.phone_number = phone_number if phone_number.present?
  profile.email = email if email.present?

  profile.save!
end

