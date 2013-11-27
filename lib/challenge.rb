class Challenge < Struct.new(:number, :nerd_level, :path)
  attr_reader :output

  def self.[](index)
    @challenges[index]
  end

  def self.all=(value)
    @challenges = value
  end

  def self.all
    @challenges
  end

  def self.next(challenge)
    @challenges[@challenges.index(challenge) + 1]
  end

  def passed?(code, type)
    t = Tempfile.new('code')
    begin
      t.write code
      t.close

      @output = `CODE_PATH=#{t.path} TYPE=#{type} rspec --fail-fast #{tests_path}`.gsub("\n", '')
      $?.success?
    ensure
      t.unlink
    end
  end

  private

  def tests_path
    "./ch-specs/ch-#{number}_spec.rb"
  end
end
