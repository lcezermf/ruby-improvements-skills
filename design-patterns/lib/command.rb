class Reactor

  def initialize
    @functional = false
    @right_command = %Q{
AmplifyShieldCommand execute!
CalibrateDriverCommand execute!
TestCompilerCommand execute!
InstallRegulatorCommand execute!
}
  end

  def functional?
    @functional
  end

  def fix(result)
    @functional = result == @right_command
  end

end

class Computer
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def add_command(command)
    @queue << command
  end

  def execute
    queue.inject("\n") { |result, command| result + command.execute + "\n" }
  end

end


class AmplifyShieldCommand
  def execute
    "AmplifyShieldCommand execute!"
  end
end

class CalibrateDriverCommand
  def execute
    "CalibrateDriverCommand execute!"
  end
end

class TestCompilerCommand
  def execute
    "TestCompilerCommand execute!"
  end
end

class InstallRegulatorCommand
  def execute
    "InstallRegulatorCommand execute!"
  end
end

