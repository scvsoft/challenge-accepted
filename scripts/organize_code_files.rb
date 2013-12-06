#!/usr/bin/ruby

require 'ohm'
require 'fileutils'
require_relative '../lib/registration'
require_relative '../lib/submission'

FileUtils.rm_rf('submissions')
FileUtils.mkdir_p('submissions/ch1')
FileUtils.mkdir_p('submissions/ch2')
FileUtils.mkdir_p('submissions/ch3')
FileUtils.mkdir_p('submissions/ch4')
FileUtils.mkdir_p('submissions/ch5')

Submission.all.each do |submission|
  registration = Registration.find(token: submission.token).first
  email = registration.email if registration
  filename = "#{submission.token}-#{email}"

  ext = case submission.type.downcase
  when "ruby" then ".rb"
  when "js", "javascript" then ".js"
  end

  filepath = "submissions/ch#{submission.challenge_number}/#{filename}#{ext}"
  File.write(filepath, submission.code)
end