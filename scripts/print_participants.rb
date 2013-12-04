#!/usr/bin/ruby

require 'ohm'
require_relative '../lib/registration'

puts " -------------------- Registered users ----------------------"

Registration.all.each do |registration|
  puts "#{registration.email}        : #{registration.token}"
end

puts " ------------------------------------------------------------ "
