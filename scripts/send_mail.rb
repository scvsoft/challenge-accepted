#!/usr/bin/ruby

require 'ohm'
require_relative '../lib/registration'
require 'net/smtp'
require 'tlsmail'

Registration.all.each do |registration|
  str_message = <<MESSAGE_END
From: SCV Soft Community <community@scvsoft.com>
To: #{registration.email} <#{registration.email}>
Subject: En un rato comienza el Challenge-Accepted de SCVSoft!

Hola! Este mensaje es solo para recordarte que estas inscripto en el Challenge Accepted 2013 de SCV.

Hoy a las 19:00 horas Argentina (GMT -0300) vamos a estar publicando un link en http://scvsoft.com/challenge-accepted al primer ejercicio.

Recordá que es MUY importante que tengas el token que te asignamos a mano, es tu llave para poder responder los ejercicios y que sepamos que fuiste vos y no otro el que contestó primero. Por si lo perdiste, tu token es: #{registration.token}

Si antes o durante el concurso tenes alguna duda, podes dejar un issue en este repo: https://github.com/scvsoft/challenge-accepted-2013

Gracias por estar participando y muchos éxitos.
MESSAGE_END

  puts " Enviando mail a: #{registration.email}"
  begin
    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
    Net::SMTP.start('smtp.gmail.com', 587, 'scvsoft.com', 'bigbrother@scvsoft.com', '5CV50ftR0ck5!', :plain) do |smtp|
      smtp.send_message str_message, 'bigbrother@scvsoft.com', registration.email
    end
  rescue Exception => e
    # Ignore any exception, continue with the following
    puts "Exception: #{e}"
  end
end
