require 'httparty'

unless ARGV.size >= 3
  puts "Usage: ruby test.rb CHALLENGE_NUMBER EMAIL TYPE < PATH_TO_CODEFILE"
  exit(-1)
end

challenge = ARGV.shift
email = ARGV.shift
type = ARGV.shift
code = ARGF.read

challenge_path = case challenge.to_i
when 1 then 'ch-1'
when 2 then 'ea660fcbaf91db3d'
when 3 then '107ebb8c601db219'
when 4 then 'eb86accd09f2b31d'
when 5 then 'e0f4b7103bb86b9e'
else
  fail 'Unexpected challenge number (1..5)'
end


puts "Challenge: #{challenge} Email: #{email} Type: #{type}"
path = "http://localhost:9292/challenge-accepted/#{challenge_path}"
puts "Path: #{path}"
puts HTTParty.post(path, {
  body: {
    email: email,
    type: type,
    code: code
  }
}).inspect