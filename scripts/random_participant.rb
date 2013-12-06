#!/usr/bin/ruby

require 'ohm'
require_relative '../lib/submission'
require_relative '../lib/registration'

token_winner = Submission.find(challenge_number: "1").map(&:token).uniq.sample
puts Registration.find(token: token_winner).first.email
