require "cuba"

LEVELS = {
  1: {
    nerd_level: 'LEVEL 1',
    next_link: "http://scvsoft.com/challenge-accepted/ea660fcbaf91db3d"
  },
  2: {
    nerd_level: 'LEVEL 2',
    next_link: "http://scvsoft.com/challenge-accepted/107ebb8c601db219"
  },
  3: {
    nerd_level: 'LEVEL 3',
    next_link: "http://scvsoft.com/challenge-accepted/eb86accd09f2b31d"
  },
  4: {
    nerd_level: 'LEVEL 4',
    next_link: "http://scvsoft.com/challenge-accepted/e0f4b7103bb86b9e"
  },
  5: {
    nerd_level: 'LEVEL 5',
  }
}

Cuba.define do
  on 'challenge-accepted' do
    on post do
      on "ch-1" do
        on param('email'), param('code'), param('type') do |email, code, type|
          t = Tempfile.new('code')
          begin
            t.write File.read('./ch-specs/ch-1_spec.rb')
            t.write "\n"
            t.write code
            t.close

            result = system "ruby #{t.path}"
          ensure
            t.unlink
          end
          if result
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
