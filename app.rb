require 'cuba'
require 'ohm'
require_relative 'lib/challenge'
require_relative 'lib/submission'
require_relative 'lib/registration'

BASE_URL = "http://scvsoft.com/challenge-accepted/"

Challenge.all = [
  Challenge.new(
    1,
    'Sheldon Cooper',
    "ch-1"),
  Challenge.new(
    2,
    'Walter White',
    "ea660fcbaf91db3d"),
  Challenge.new(
    3,
    'Nikola Tesla',
    "107ebb8c601db219"),
  Challenge.new(
    4,
    'Stephen Hawking',
    "eb86accd09f2b31d"),
  Challenge.new(
    5,
    'Spock',
    "e0f4b7103bb86b9e")
]

Cuba.define do
  def self.handle_submission_for(challenge)
    on param('token'), param('code'), param('type') do |token, code, type|
      unless Registration.find(token: token).empty?
        if challenge.passed?(code, type)
          Submission.create(
            challenge_number: challenge.number,
            token: token,
            code: code,
            type: type,
            created_at: Time.now.to_f) if Submission.find(challenge_number: challenge.number, token: token).empty?
          res.status = 200
          res['X-NERD-LEVEL'] = challenge.nerd_level

          if next_challenge = Challenge.next(challenge)
            res.write "Next exercise: #{BASE_URL}#{next_challenge.path}.html"
          else
            res.write "You completed all exercises! Congratulations! We're checking if all your answers are valid and will publish the final result at http://scvsoft.com/challenge-accepted/winners on December 6, 2013 (also we will send you an email)."
          end
        else
          res.status = 422
          res.write "WRONG! The output of the test was: #{challenge.output}"
        end
      else
        res.status = 401
        res.write "Your token is not registered!"
      end
    end
    on default do
      res.status = 400
    end
  end

  on 'challenge-accepted' do
    on post do
      on 'register' do
        on param('email') do |email|
          registration = Registration.new(email: email.downcase)
          registration.generate_token
          res['Access-Control-Allow-Origin'] = "*"
          begin
            if registration.save
              res.status = 200
              res.write "{ \"registration_token\": \"#{registration.token}\" }"
            else
              res.status = 422
              res.write "Hubo un problema con tu registración: Email incorrecto."
            end
          rescue Ohm::UniqueIndexViolation
            registration = Registration.find(email: email.downcase).first
            res.status = 200
            res.write "{ \"registration_token\": \"#{registration.token}\"}"
          end
        end
      end

      Challenge.all.each do |challenge|
        on(challenge.path) { handle_submission_for(challenge) }
      end

      on default do
        res.status = 404
      end
    end
  end

end
