class Bicycle
  attr_reader :size, :spares

  def initialize(params = {})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end
