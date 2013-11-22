require 'timeout'

class Executor
  attr :type, :code_path

  def initialize(type, code_path)
    @type = type
    @code_path = code_path
  end

  def execute(*args)

    args_string = args.join(' ')

    case @type
    when "ruby"
      Timeout::timeout(1) do
        `ruby -T3 #{code_path} #{args_string}`.strip
      end
    when "js"
      open(code_path, 'a') { |f| f.puts "phantom.exit();" }
      `phantomjs #{code_path} #{args_string}`.strip
    end
  end
end
