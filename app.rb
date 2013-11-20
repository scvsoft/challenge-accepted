require "cuba"
require_relative 'lib/challenge'
require_relative 'lib/submission'

BASE_URL = "http://scvsoft.com/challenge-accepted/"

Challenge.all = [
  Challenge.new(
    1,
    'LEVEL 1',
    "ch-1"),
  Challenge.new(
    2,
    'LEVEL 2',
    "ea660fcbaf91db3d"),
  Challenge.new(
    3,
    'LEVEL 3',
    "107ebb8c601db219"),
  Challenge.new(
    4,
    'LEVEL 4',
    "eb86accd09f2b31d"),
  Challenge.new(
    5,
    'LEVEL 5',
    "e0f4b7103bb86b9e")
]

Cuba.define do
  def self.handle_submission_for(challenge)
    on param('email'), param('code'), param('type') do |email, code, type|
      sub = Submission.new(challenge, code, type)
      if sub.passed?
        res.status = 200
        res['X-NERD-LEVEL'] = challenge.nerd_level

        if next_challenge = Challenge.next(challenge)
          res.write "Next exercise: #{BASE_URL}#{next_challenge.path}"
        else
          res.write "You completed all exercises! Congratulations!"
        end
      else
        res.status = 422
        res.write "WRONG!"
      end
    end
    on default do
      res.status = 400
    end
  end

  on 'challenge-accepted' do
    on post do
      Challenge.all.each do |challenge|
        on(challenge.path) { handle_submission_for(challenge) }
      end

      on default do
        res.status = 404
      end
    end
  end

end