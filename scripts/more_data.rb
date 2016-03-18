#!/usr/bin/env ruby

require 'rubygems'
require 'rails/commands/runner'
require 'nokogiri'

Profile.all.each do |p|
  p.add_tags(p.role)
  p.save!
end

users = {

  'dnd' => [
    'seidl',
    'sarim',
    'eysman',
    'zhang'
],

  'distribution' => [
    'seidl',
    'sumanth'
],

  'platform team' => [
    'dennis poon',
    'krista',
    'ruban',
    'vuuren',
    'david jacob',
    'zeekid',
    'mohan',
    'raymond lai',
    'trace',
    'petrie',
    'cao',
    'justin ho',
    'nour'
]


}

users.each do |tag, users|
  users.each do |u|
    p =  Profile.where('name LIKE ?', "%#{u}%").first
    p.add_tags(tag)
    p.save!
  end
end

