class Computer
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def add_command(command)
    @queue << command
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

