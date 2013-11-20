class Submission < Struct.new(:challenge, :code, :type)
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