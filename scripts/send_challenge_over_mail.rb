#!/usr/bin/ruby

require 'ohm'
require_relative '../lib/registration'
require 'net/smtp'
require 'tlsmail'

Registration.all.each do |registration|
  str_message = <<MESSAGE_END
From: SCV Soft Community <community@scvsoft.com>
To: #{registration.email} <#{registration.email}>
Subject: Ya terminó el Challenge Accepted!

Hola! Te queriamos avisar que ya cerramos el Challenge Accepted de este año.

Para nosotros fue una linda experiencia. Desde nuestro centro de mandos ibamos viendo el progreso de varios de ustedes y nos iban llegando preguntas sobre problemas que se iban encontrando. Tenemos pila de cosas para mejorar en el concurso del año que viene y eso nos da ganas de ya empezar a prepararnos!

Durante el día de hoy vamos a estar publicando en la página http://scvsoft.com/challenge-accepted la lista de ganadores.

Gracias nuevamente por participar!
MESSAGE_END

  puts " Eviando mail a: #{registration.email}"
  begin
    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
    Net::SMTP.start('smtp.gmail.com', 587, 'scvsoft.com', 'bigbrother@scvsoft.com', '5CV50ftR0ck5!', :plain) do |smtp|
      smtp.send_message str_message, 'bigbrother@scvsoft.com', registration.email
    end
  rescue Exception => e
    # Ignore any exception, continue with the following email
    puts "Exception: #{e}"
  end
end

