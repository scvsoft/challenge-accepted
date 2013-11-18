require "cuba"

LEVELS = {
  1 => {
    nerd_level: 'LEVEL 1',
    next_link: "http://scvsoft.com/challenge-accepted/ea660fcbaf91db3d"
  },
  2 => {
    nerd_level: 'LEVEL 2',
    next_link: "http://scvsoft.com/challenge-accepted/107ebb8c601db219"
  },
  3 => {
    nerd_level: 'LEVEL 3',
    next_link: "http://scvsoft.com/challenge-accepted/eb86accd09f2b31d"
  },
  4 => {
    nerd_level: 'LEVEL 4',
    next_link: "http://scvsoft.com/challenge-accepted/e0f4b7103bb86b9e"
  },
  5 => {
    nerd_level: 'LEVEL 5',
  }
}

Cuba.define do
  on 'challenge-accepted' do
    on post do
      on "ch-1" do
        on param('email'), param('code'), param('type') do |email, code, type|
          sub = Submission.new(Challenge[0], code, type)
          if sub.passed?
            res.status = 200
            res['X-NERD-LEVEL'] = LEVELS[1][:nerd_level]
            res.write LEVELS[1][:next_link]
          else
            res.status = 422
            res.write "BAD!"
          end
        end
        on default do
          res.status = 400
        end
      end
      on default do
        res.status = 404
      end
    end
  end
end

class Submission
  attr :challenge, :code, :type

  def initialize(challenge, code, type)
    @challenge = challenge
    @code = code
    @type = type
  end

  def passed?
    t = Tempfile.new('code')
    begin
      t.write code
      t.close

      system "CODE_PATH=#{t.path} TYPE=#{type} ruby #{challenge.tests_path}"
    ensure
      t.unlink
    end
  end
end

class Challenge
  def self.[](index)
    self.all[index]
  end

  def self.all
    @challenges ||= [
      Challenge.new(1),
      Challenge.new(2),
      Challenge.new(3),
      Challenge.new(4),
      Challenge.new(5)
    ]
  end

  attr :number

  def initialize(number)
    @number = number
  end

  def tests_path
    "./ch-specs/ch-#{number}_spec.rb"
  end
end
