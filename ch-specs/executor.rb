require 'timeout'

class Executor
  attr :type, :code_path

  def initialize(type, code_path)
    @type = type
    @code_path = code_path
  end

  def execute(*args)

    args_string = args.join(' ')

    Timeout::timeout(1) do
      case @type
      when "ruby"
        `ruby -T3 #{code_path} #{args_string}`.strip
      when "js"
        args_string += " #{code_path}"
        `nodejs ch-specs/node_sandbox.js #{args_string}`.strip
      end
    end
  end
end
