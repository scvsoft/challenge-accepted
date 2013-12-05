#!/usr/bin/ruby

require 'redis'
require 'ohm'
require_relative '../lib/registration'
require_relative '../lib/submission'

game_init_time       = Time.new(2013, 12, 5, 19, 0, 0, "-03:00")
elapsed_time         = (Time.now - game_init_time).to_i / 60 / 60 # seconds to hour
redis_status         = (Redis.new.ping.eql? "PONG") ? "CONNECTED" : "NOT CONNECTED" rescue "NOT CONNECTED"


puts " ------------------------------------------- Challenge-Accepted Dashboard --------------------------------------- "
puts " "

if "CONNECTED".eql? redis_status
  total_participants   = Registration.all.count
  total_exercise_one   = Submission.find(challenge_number: "1").count
  total_exercise_two   = Submission.find(challenge_number: "2").count
  total_exercise_three = Submission.find(challenge_number: "3").count
  total_exercise_four  = Submission.find(challenge_number: "4").count
  winners              = Submission.find(challenge_number: "5")
  puts " Estado Redis: #{redis_status}"
  puts " "
  puts " Total Participantes: #{total_participants}                                                Tiempo de Juego: #{elapsed_time} Hs"
  puts " "
  puts "                                    ===============================================                               "
  puts " "
  puts " Total Aciertos Ejercicio 1: #{'%2d' % total_exercise_one}                              % Sobre Total: #{'%3.2f' % (total_exercise_one / total_participants * 100)}% "
  puts " Total Aciertos Ejercicio 2: #{'%2d' % total_exercise_two}                              % Sobre Total: #{'%3.2f' % (total_exercise_two / total_participants * 100)}% "
  puts " Total Aciertos Ejercicio 3: #{'%2d' % total_exercise_three}                              % Sobre Total: #{'%3.2f' % (total_exercise_three / total_participants * 100)}% "
  puts " Total Aciertos Ejercicio 4: #{'%2d' % total_exercise_four}                              % Sobre Total: #{'%3.2f' % (total_exercise_four / total_participants * 100)}% "
  puts " Total Aciertos Ejercicio 5: #{'%2d' % winners.count}                              % Sobre Total: #{'%3.2f' % (winners.count / total_participants * 100)}% "
  puts " "
  puts "                                   =================== GANADORES =================                                "
  puts " "
  if winners.empty?
    puts "                                                       No hay ganadores todavia "
  else
    winners.each do |winner|
      registration = Registration.find(token: winner.token).first
      puts " Mail: #{registration.email}            Termino a las: #{Time.at(winner.created_at.to_f)}          Tiempo total: #{(Time.at(winner.created_at.to_f) - game_init_time).to_i / 60 / 60}        "
    end
  end
else
  puts " Estado Redis: #{redis_status} "
end

puts " ---------------------------------------------------------------------------------------------------------------- "
