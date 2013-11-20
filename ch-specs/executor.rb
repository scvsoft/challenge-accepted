class Executor
  attr :type, :code_path

  def initialize(type, code_path)
    @type = type
    @code_path = code_path
  end

  def execute(*args)
    args_string = args.join(' ')
    `ruby -T3 #{code_path} #{args_string}`.strip
  end
end
