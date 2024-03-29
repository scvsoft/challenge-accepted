require 'timeout'

class Executor
  attr :type, :code_path

  def initialize(type, code_path)
    @type = type.downcase
    @code_path = code_path
  end

  def execute(*args)

    args_string = args.join(' ')

    Timeout::timeout(1) do
      case @type
      when "ruby"
        `ruby -T3 #{code_path} #{args_string}`.strip
      when "js", "javascript"
        args_string += " #{code_path}"
        `node ch-specs/node_sandbox.js #{args_string}`.strip
      end
    end
  end
end
